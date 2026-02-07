## Minecraft load time benchmark

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
268 sec
<br>
<sup><sub>(
4:28 min
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
        {label: 'Mixins\n', data: [26.00]},
        {label: 'Construction\n', data: [57.00]},
        {label: 'PreInit\n', data: [124.00]},
        {label: 'Init\n', data: [59.00]},
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
          value: 26,
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
436e17  8.92s Had Enough Items;
395E14  1.24s [JEI Ingredient Filter];
395E14  7.77s [JEI Plugins];
5161a8  7.03s CraftTweaker2;
516fa8  6.15s Ender IO;
6e5e17  6.09s Tinkers' Antique;
5E5014  4.00s [TCon Textures];
8f304e  5.62s Astral Sorcery;
a651a8  4.72s IndustrialCraft 2;
cd922c  3.73s NuclearCraft;
216364  3.48s Xaero's Minimap;
213664  3.30s Forestry;
813e81  3.14s OpenComputers;
6e175e  2.97s Recurrent Complex;
8c2ccd  2.36s Immersive Engineering;
ba3eb8  2.25s Cyclic;
436e17  2.25s Integrated Dynamics;
306e8f  2.23s Custom Loading Screen;
308f7e  2.17s Quark: RotN Edition;
444444 33.17s 21 Other mods;
333333 48.26s 152 'Fast' mods (1.0s - 0.1s);
222222  8.13s 296 'Instant' mods (%3C 0.1s)
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
CraftTweaker2                 | 0.11| 0.00| 2.64| 4.24| 0.00| 0.04| 0.00| 0.00;
Ender IO                      | 1.45| 0.01| 2.69| 0.29| 1.70| 0.00| 0.01| 0.00;
Tinkers' Antique              | 0.77| 0.01| 0.11| 1.21| 0.00| 0.00| 0.00| 4.00;
Astral Sorcery                | 0.20| 0.00| 4.25| 1.16| 0.00| 0.00| 0.00| 0.00;
IndustrialCraft 2             | 0.76| 0.01| 3.24| 0.72| 0.00| 0.00| 0.00| 0.00;
NuclearCraft                  | 0.05| 0.01| 2.80| 0.84| 0.00| 0.00| 0.03| 0.00;
Xaero's Minimap               | 0.09| 0.00| 0.04| 3.35| 0.00| 0.00| 0.00| 0.00;
Forestry                      | 0.33| 0.01| 2.05| 0.92| 0.00| 0.00| 0.00| 0.00;
OpenComputers                 | 0.17| 0.01| 1.34| 1.55| 0.07| 0.00| 0.00| 0.00;
Recurrent Complex             | 0.18| 0.00| 0.29| 2.50| 0.00| 0.00| 0.00| 0.00;
[Mod Average]                 | 0.07| 0.00| 0.15| 0.08| 0.00| 0.00| 0.00| 0.01
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
 1.26: li.cil.oc.integration.jei.ModPluginOpenComputers;
 0.91: jeresources.jei.JEIConfig;
 0.80: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
 0.67: crazypants.enderio.machines.integration.jei.MachinesPlugin;
 0.46: mezz.jei.plugins.vanilla.VanillaPlugin;
 0.45: com.buuz135.industrial.jei.JEICustomPlugin;
 0.39: ic2.jeiIntegration.SubModule;
 0.30: crafttweaker.mods.jei.JEIAddonPlugin;
 0.24: thaumicenergistics.integration.jei.ThEJEI;
 0.17: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
 0.15: crazypants.enderio.base.integration.jei.JeiPlugin;
 0.15: knightminer.tcomplement.plugin.jei.JEIPlugin;
 1.82: Other
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
            text: '99.54s',
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
994400  1.49s Reloading;
001799  2.41s Loading Resource - AssetLibrary;
179900  2.99s Preloading 51410 textures;
0D9900  1.62s Texture loading;
009926  5.61s Posting bake events;
009930 29.39s Setting up dynamic models;
00993A 29.46s Loading Resource - ModelManager;
009299 30.29s Rendering Setup;
590099  1.65s XML Recipes;
630099  2.16s InterModComms;
997700 10.71s [VintageFix]: Texture search 69973 sprites;
998200  3.20s Preloaded 33662 sprites
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
