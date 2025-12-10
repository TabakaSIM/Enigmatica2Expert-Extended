## Minecraft load time benchmark

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
337 sec
<br>
<sup><sub>(
5:37 min
)</sub></sup>
</p>

<br>
<!--
Note for image scripts:
  - Newlines are ignored
  - This characters cant be used: +<"%#
-->
<p align="center">
<img src="https://quickchart.io/chart.png?w=400&h=60&c={
  type: 'horizontalBar',
  data: {
    datasets: [
        {label: 'Mixins\n', data: [36.00]},
        {label: 'Construction\n', data: [70.00]},
        {label: 'PreInit\n', data: [157.00]},
        {label: 'Init\n', data: [71.00]},
    ]
  },
  options: {
    layout: { padding: { top: 10 } },
    scales: {
      xAxes: [{display: false, stacked: true}],
      yAxes: [{display: false, stacked: true}],
    },
    elements: {rectangle: {borderWidth: 2}},
    legend: {display: false},
    plugins: {datalabels: {
      color: 'white',
      font: {
        family: 'Consolas',
      },
      formatter: (value, context) =>
        [context.dataset.label, value, 's'].join('')
    }},
    annotation: {
      clip: false,
      annotations: [{
          type: 'line',
          scaleID: 'x-axis-0',
          value: 36,
          borderColor: 'black',
          label: {
            content: 'Window appear',
            fontSize: 8,
            enabled: true,
            xPadding: 8, yPadding: 2,
            yAdjust: -20
          },
        }
      ]
    },
  }
}"/>
</p>

<br>

# Mods Loading Time

<p align="center">
<img src="https://quickchart.io/chart.png?w=400&h=300&c={
  type: 'outlabeledPie',
  options: {
    rotation: Math.PI,
    cutoutPercentage: 25,
    plugins: {
      legend: !1,
      outlabels: {
        stretch: 5,
        padding: 1,
        text: (v,i)=>[
          v.labels[v.dataIndex],' ',
          (v.percent*1000|0)/10,
          String.fromCharCode(37)].join('')
      }
    }
  },
  data: {...
`
6e5e17 16.25s Tinkers' Antique;
5E5014 14.00s [TCon Textures];
436e17 11.34s Had Enough Items;
395E14  1.56s [JEI Ingredient Filter];
395E14 10.62s [JEI Plugins];
8f304e 10.98s Astral Sorcery;
5161a8  8.31s CraftTweaker2;
516fa8  7.75s Ender IO;
a651a8  5.79s IndustrialCraft 2;
813e81  4.67s OpenComputers;
cd922c  4.17s NuclearCraft;
6e175e  3.46s Recurrent Complex;
213664  3.37s Forestry;
3eb2ba  3.02s Botania;
3e8160  2.67s The Twilight Forest;
436e17  2.42s Integrated Dynamics;
ba3eb8  2.40s Cyclic;
813e80  2.40s Shadowfacts' Forgelin (Dummy);
3e68ba  2.38s AE2 Unofficial Extended Life;
444444 43.69s 27 Other mods;
333333 50.86s 158 'Fast' mods (1.0s - 0.1s);
222222  7.83s 284 'Instant' mods (%3C 0.1s)
`
    .split(';').reduce((a, l) => {
      l.match(/(\w{6}) *(\d*\.\d*) ?s (.*)/s)
      .slice(1).map((a, i) => [[String.fromCharCode(35),a].join(''), a,
        a.length > 15 ? a.split(/(?%3C=.{9})\s(?=\S{5})/).join('\n') : a
      ][i])
      .forEach((s, i) =>
        [a.datasets[0].backgroundColor, a.datasets[0].data, a.labels][i].push(s)
      );
      return a
    }, {
      labels: [],
      datasets: [{
        backgroundColor: [],
        data: [],
        borderColor: 'rgba(22,22,22,0.3)',
        borderWidth: 1
      }]
    })
  }
}"/>
</p>

<br>

# Loader steps

Show how much time each mod takes on each game load phase.

JEI/HEI not included, since its load time based on other mods and overal item count.

<p align="center">
<img src="https://quickchart.io/chart.png?w=400&h=450&c={
  options: {
    scales: {
      xAxes: [{stacked: true}],
      yAxes: [{stacked: true}],
    },
    plugins: {
      datalabels: {
        anchor: 'end',
        align: 'top',
        color: 'white',
        backgroundColor: 'rgba(46, 140, 171, 0.6)',
        borderColor: 'rgba(41, 168, 194, 1.0)',
        borderWidth: 0.5,
        borderRadius: 3,
        padding: 0,
        font: {size:10},
        formatter: (v,ctx) =>
          ctx.datasetIndex!=ctx.chart.data.datasets.length-1 ? null
            : [((ctx.chart.data.datasets.reduce((a,b)=>a- -b.data[ctx.dataIndex],0)*10)|0)/10,'s'].join('')
      },
      colorschemes: {
        scheme: 'office.Damask6'
      }
    }
  },
  type: 'bar',
  data: {...(() => {
    let a = { labels: [], datasets: [] };
`
0: Construction;
1: Loading Resources;
2: PreInitialization;
3: Initialization;
4: InterModComms;
5: LoadComplete;
6: ModIdMapping;
7: Other
`
    .split(';')
      .map(l => l.match(/\d: (.*)/).slice(1))
      .forEach(([name]) => a.datasets.push({ label: name, data: [] }));
`
                                  0      1      2      3      4      5      6      7;
Tinkers' Antique              | 1.16| 0.01| 0.12| 0.96| 0.00| 0.00| 0.00|14.00;
Astral Sorcery                | 0.19| 0.00| 6.54| 4.25| 0.00| 0.00| 0.00| 0.00;
CraftTweaker2                 | 0.36| 0.00| 3.00| 4.87| 0.00| 0.07| 0.00| 0.00;
Ender IO                      | 2.51| 0.01| 3.12| 0.31| 1.78| 0.00| 0.02| 0.00;
IndustrialCraft 2             | 1.08| 0.01| 3.87| 0.84| 0.00| 0.00| 0.00| 0.00;
OpenComputers                 | 0.17| 0.01| 1.57| 2.85| 0.07| 0.00| 0.00| 0.00;
NuclearCraft                  | 0.05| 0.01| 3.15| 0.92| 0.00| 0.00| 0.04| 0.00;
Recurrent Complex             | 0.21| 0.00| 0.33| 2.91| 0.00| 0.00| 0.00| 0.00;
Forestry                      | 0.39| 0.01| 2.22| 0.75| 0.00| 0.00| 0.00| 0.00;
Botania                       | 2.30| 0.01| 0.51| 0.20| 0.00| 0.00| 0.00| 0.00;
[Mod Average]                 | 0.08| 0.00| 0.17| 0.10| 0.01| 0.01| 0.00| 0.03
`
    .split(';').slice(1)
      .map(l => l.split('|').map(s => s.trim()))
      .forEach(([name, ...arr], i) => {
        a.labels.push(name);
        arr.forEach((v, j) => a.datasets[j].data[i] = v)
      }); return a
  })()}
}"/>
</p>

<br>

# TOP JEI Registered Plugis

<p align="center">
<img src="https://quickchart.io/chart.png?w=500&h=200&c={
  options: {
    elements: { rectangle: { borderWidth: 1 } },
    legend: false,
    scales: {
      yAxes: [{ ticks: { fontSize: 9, fontFamily: 'Verdana' }}],
    },
  },
  type: 'horizontalBar',
    data: {...(() => {
      let a = {
        labels: [], datasets: [{
          backgroundColor: 'rgba(0, 99, 132, 0.5)',
          borderColor: 'rgb(0, 99, 132)',
          data: []
        }]
      };
`
 1.77: li.cil.oc.integration.jei.ModPluginOpenComputers;
 1.23: jeresources.jei.JEIConfig;
 0.94: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
 0.80: mezz.jei.plugins.vanilla.VanillaPlugin;
 0.75: com.buuz135.industrial.jei.JEICustomPlugin;
 0.71: crazypants.enderio.base.integration.jei.JeiPlugin;
 0.70: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
 0.55: crazypants.enderio.machines.integration.jei.MachinesPlugin;
 0.43: ic2.jeiIntegration.SubModule;
 0.24: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
 0.21: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
 0.19: knightminer.tcomplement.plugin.jei.JEIPlugin;
 2.11: Other
`
        .split(';')
        .map(l => l.split(':'))
        .forEach(([time, name]) => {
          a.labels.push(name);
          a.datasets[0].data.push(time)
        })
        ; return a
    })()
  }
}"/>
</p>

<br>

# FML Stuff

Loading bars that usually not related to specific mods.

⚠️ Shows only steps that took 1.0 sec or more.

<p align="center">
<img src="https://quickchart.io/chart.png?w=500&h=400&c={
  options: {
    rotation: Math.PI*1.125,
    cutoutPercentage: 55,
    plugins: {
      legend: !1,
      outlabels: {
        stretch: 5,
        padding: 1,
        text: (v)=>v.labels
      },
      doughnutlabel: {
        labels: [
          {
            text: 'FML stuff:',
            color: 'rgba(128, 128, 128, 0.5)',
            font: {size: 18}
          },
          {
            text: '117.65s',
            color: 'rgba(128, 128, 128, 1)',
            font: {size: 22}
          }
        ]
      },
    }
  },
  type: 'outlabeledPie',
  data: {...(() => {
    let a = {
      labels: [],
      datasets: [{
        backgroundColor: [],
        data: [],
        borderColor: 'rgba(22,22,22,0.3)',
        borderWidth: 2
      }]
    };
`
994400  1.59s Reloading;
001799  4.10s Loading Resource - AssetLibrary;
229900  3.91s Preloading 51430 textures;
179900  2.25s Texture loading;
009907  2.50s Texture mipmap and upload;
00991C  5.04s Posting bake events;
009926 46.11s Setting up dynamic models;
009930 46.19s Loading Resource - ModelManager;
009996 47.86s Rendering Setup;
440099  1.72s XML Recipes;
4F0099  2.48s InterModComms;
990073  2.19s Loading Resource - ItemColorizationHelper;
99007D 13.98s [VintageFix]: Texture search 69987 sprites;
990073  4.04s Preloaded 33682 sprites
`
    .split(';')
      .map(l => l.match(/(\w{6}) *(\d*\.\d*) ?s (.*)/s))
      .forEach(([, col, time, name]) => {
        a.labels.push([
          name.length > 15 ? name.split(/(?%3C=.{11})\s(?=\S{6})/).join('\n') : name
          , ' ', time, 's'
        ].join(''));
        a.datasets[0].data.push(parseFloat(time));
        a.datasets[0].backgroundColor.push([String.fromCharCode(35), col].join(''))
      })
      ; return a
  })()}
}"/>
</p>
