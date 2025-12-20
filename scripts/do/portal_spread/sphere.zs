/**
 * @file Math functions to find positions in 3d sphere
 *
 * @author https://github.com/dobrokot
 */

#priority 3000
#modloaded zenutils
#loader contenttweaker

// Create class to avoid initialization of the array on each loader
zenClass Op {
  static table_sum_of_two_squares_variants as int[][int][int] = {} as int[][int][int];

  // Create cache of points around portal to faster acces
  static initialized as bool = false;
}

// Maximum radius of portal with all modifiers. Must be less than 256
// Consume ~ maxRadius³ kb RAM memory
static maxRadius as int = 64;

// 8 is maximum z_group size in table_sum_of_two_squares_variants for maxRadius=256.
// For maxRadius=64 its 4
static MAX_GROUP_SIZE as int = 4;

// Number of possible mirrors of one point in 3d sphere
static MAX_MIRRORS as int = 16;

// Number of variations of z for same square distance
static MAX_Z_VARIANTS as int = maxRadius + 2;

// Number of indexes in same 2d squared distance
static MAX_DISTANCE_INDEXES as int = MAX_GROUP_SIZE * MAX_Z_VARIANTS * MAX_MIRRORS;

function init() as void {
  print('Initializing sphere array for portal_spread calculations...');
  Op.initialized = true;
  for x in 0 .. (maxRadius + 1) {
    for y in 0 .. (x + 1) {
      val x2_y2 = x * x + y * y;
      if (x2_y2 > maxRadius * maxRadius) continue;

      // Add new map if not exist
      if (isNull(Op.table_sum_of_two_squares_variants[x2_y2])) {
        Op.table_sum_of_two_squares_variants[x2_y2] = {} as int[][int];
      }

      // "push" implementation
      for i in 0 .. maxRadius {
        if (isNull(Op.table_sum_of_two_squares_variants[x2_y2][i])) {
          Op.table_sum_of_two_squares_variants[x2_y2][i] = [x, y] as int[];
          break;
        }
      }
    }
  }
}

/**
* Returns [i, x, y, z] where i is next index
*/
function getNextPoint(index as int) as int[] {
  if (!Op.initialized) init();

  // Index is integer-packed [ distance_squared_3d, z, group_index, mirror_index ]
  // with dimensions (anything * MAX_Z_VARIANTS * MAX_GROUP_SIZE * MAX_MIRRORS)
  val distance_squared_3d = index / MAX_DISTANCE_INDEXES;

  // Loop back if reached end or max radius
  if (distance_squared_3d > maxRadius * maxRadius)
    return getNextPoint(1);

  val distance_index = index % MAX_DISTANCE_INDEXES;
  var z = distance_index / (MAX_GROUP_SIZE * MAX_MIRRORS);

  // Go to next z point
  if (z * z > distance_squared_3d)
    return getNextPoint((distance_squared_3d + 1) * MAX_DISTANCE_INDEXES);

  val group_index = distance_index % (MAX_GROUP_SIZE * MAX_MIRRORS) / MAX_MIRRORS;
  val mirror_index = distance_index % MAX_MIRRORS;

  val distance_squared_2d = distance_squared_3d - z * z;
  val z_group = Op.table_sum_of_two_squares_variants[distance_squared_2d];

  // Go to next group
  if (isNull(z_group) || isNull(z_group[group_index]))
    return getNextPoint(distance_squared_3d * MAX_DISTANCE_INDEXES + (z + 1) * (MAX_GROUP_SIZE * MAX_MIRRORS));

  val xy = z_group[group_index];
  var x = xy[0] as int;
  var y = xy[1] as int;

  val unwatend_reflections_mask
    = 1 * (x == 0 ? 1 : 0)
    + 2 * (y == 0 ? 1 : 0)
    + 4 * (z == 0 ? 1 : 0)
    + 8 * (x == y ? 1 : 0);

  var next_mirror_index = mirror_index + 1;
  while ((next_mirror_index & unwatend_reflections_mask) != 0)
    next_mirror_index += 1;

  if (mirror_index % 2 == 1) x = -x;
  if ((mirror_index / 2) % 2 == 1) y = -y;
  if ((mirror_index / 4) % 2 == 1) z = -z;
  if ((mirror_index / 8) % 2 == 1) { val _x as int = x; x = y; y = _x; }

  return [index + next_mirror_index - mirror_index, x, y, z];
}

function radiusToIndex(radius as int) as int {
  return MAX_DISTANCE_INDEXES * radius * radius;
}

function indexToRadius(index as int) as int {
  return min(maxRadius, pow(index / MAX_DISTANCE_INDEXES, 0.5));
}
