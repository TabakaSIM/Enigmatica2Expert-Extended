#modloaded bloodsmeltery

// Recycling blocks
for i, fluid in [
  <fluid:raw_will>,
  <fluid:corrosive_will>,
  <fluid:destructive_will>,
  <fluid:vengeful_will>,
  <fluid:steadfast_will>,
] {
  scripts.process.melt(<bloodmagic:demon_extras>.definition.makeStack(i), fluid * 50);
}
