## Minecraft load time benchmark

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
286 sec
<br>
<sup><sub>(
4:46 min
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
        {label: 'Mixins\n', data: [35.00]},
        {label: 'Construction\n', data: [61.00]},
        {label: 'PreInit\n', data: [132.00]},
        {label: 'Init\n', data: [54.00]},
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
          value: 35,
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
436e17  8.32s Had Enough Items;
395E14  0.84s [JEI Ingredient Filter];
395E14  7.26s [JEI Plugins];
5161a8  7.63s CraftTweaker2;
516fa8  6.46s Ender IO;
8f304e  5.69s Astral Sorcery;
a651a8  4.75s IndustrialCraft 2;
cd922c  4.12s NuclearCraft;
6e5e17  3.60s Tinkers' Antique;
5E5014  2.00s [TCon Textures];
6e175e  3.48s Recurrent Complex;
813e81  3.41s OpenComputers;
213664  3.06s Forestry;
306e8f  2.50s Custom Loading Screen;
a86e51  2.46s Extra Utilities 2;
308f7e  2.40s Quark: RotN Edition;
8f4d30  2.25s Open Terrain Generator;
ba3eb8  2.24s Cyclic;
436e17  2.24s Integrated Dynamics;
444444 35.66s 24 Other mods;
333333 45.61s 149 'Fast' mods (1.0s - 0.1s);
222222  7.47s 294 'Instant' mods (%3C 0.1s)
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
CraftTweaker2                 | 0.12| 0.00| 2.54| 4.91| 0.00| 0.06| 0.00| 0.00;
Ender IO                      | 1.78| 0.01| 2.74| 0.32| 1.59| 0.00| 0.01| 0.00;
Astral Sorcery                | 0.21| 0.00| 4.47| 1.01| 0.00| 0.00| 0.00| 0.00;
IndustrialCraft 2             | 0.69| 0.01| 3.33| 0.72| 0.00| 0.00| 0.00| 0.00;
NuclearCraft                  | 0.04| 0.01| 3.10| 0.93| 0.00| 0.00| 0.04| 0.00;
Tinkers' Antique              | 0.79| 0.01| 0.10| 0.70| 0.00| 0.00| 0.00| 2.00;
Recurrent Complex             | 0.14| 0.00| 0.37| 2.97| 0.00| 0.00| 0.00| 0.00;
OpenComputers                 | 0.14| 0.01| 1.65| 1.56| 0.05| 0.00| 0.00| 0.00;
Forestry                      | 0.26| 0.01| 2.19| 0.61| 0.00| 0.00| 0.00| 0.00;
Custom Loading Screen         | 2.50| 0.00| 0.00| 0.00| 0.00| 0.00| 0.00| 0.00;
[Mod Average]                 | 0.06| 0.00| 0.16| 0.08| 0.00| 0.00| 0.00| 0.00
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
 1.28: li.cil.oc.integration.jei.ModPluginOpenComputers;
 0.89: jeresources.jei.JEIConfig;
 0.64: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
 0.55: com.buuz135.industrial.jei.JEICustomPlugin;
 0.55: mezz.jei.plugins.vanilla.VanillaPlugin;
 0.43: crazypants.enderio.machines.integration.jei.MachinesPlugin;
 0.34: ic2.jeiIntegration.SubModule;
 0.19: crazypants.enderio.base.integration.jei.JeiPlugin;
 0.18: knightminer.tcomplement.plugin.jei.JEIPlugin;
 0.17: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
 0.15: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
 0.14: thaumicenergistics.integration.jei.ThEJEI;
 1.75: Other
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
            text: '123.27s',
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
994400  1.71s Reloading;
001799  2.55s Loading Resource - AssetLibrary;
229900  3.35s Preloading 51456 textures;
179900  1.48s Texture loading;
00991C  4.70s Posting bake events;
009926 30.57s Setting up dynamic models;
009930 30.65s Loading Resource - ModelManager;
009996 31.41s Rendering Setup;
440099  1.53s XML Recipes;
4F0099  2.02s InterModComms;
99004A 12.96s [VintageFix]: Texture search 69577 sprites;
990040  3.55s Preloaded 33708 sprites
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
