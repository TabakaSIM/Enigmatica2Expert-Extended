## Minecraft load time benchmark

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
262 sec
<br>
<sup><sub>(
4:22 min
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
        {label: 'Mixins\n', data: [24.00]},
        {label: 'Construction\n', data: [59.00]},
        {label: 'PreInit\n', data: [123.00]},
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
          value: 24,
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
436e17  7.82s Had Enough Items;
395E14  1.43s [JEI Ingredient Filter];
395E14  7.69s [JEI Plugins];
5161a8  7.29s CraftTweaker2;
516fa8  5.72s Ender IO;
8f304e  5.43s Astral Sorcery;
a651a8  4.67s IndustrialCraft 2;
6e5e17  4.66s Tinkers' Antique;
5E5014  3.00s [TCon Textures];
cd922c  3.40s NuclearCraft;
6e175e  3.31s Recurrent Complex;
213664  3.13s Forestry;
813e81  3.08s OpenComputers;
306e8f  2.42s Custom Loading Screen;
308f7e  2.35s Quark: RotN Edition;
436e17  2.14s Integrated Dynamics;
3eb2ba  2.13s Botania;
ba3eb8  2.02s Cyclic;
216364  1.95s Thermal Expansion;
444444 33.33s 23 Other mods;
333333 44.73s 145 'Fast' mods (1.0s - 0.1s);
222222  8.20s 300 'Instant' mods (%3C 0.1s)
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
CraftTweaker2                 | 0.09| 0.00| 2.82| 4.34| 0.00| 0.04| 0.00| 0.00;
Ender IO                      | 1.36| 0.01| 2.61| 0.27| 1.47| 0.00| 0.01| 0.00;
Astral Sorcery                | 0.16| 0.00| 4.32| 0.95| 0.00| 0.00| 0.00| 0.00;
IndustrialCraft 2             | 0.65| 0.01| 3.31| 0.72| 0.00| 0.00| 0.00| 0.00;
Tinkers' Antique              | 0.71| 0.01| 0.12| 0.81| 0.00| 0.00| 0.00| 3.00;
NuclearCraft                  | 0.06| 0.01| 2.45| 0.86| 0.00| 0.00| 0.03| 0.00;
Recurrent Complex             | 0.14| 0.00| 0.28| 2.90| 0.00| 0.00| 0.00| 0.00;
Forestry                      | 0.33| 0.01| 2.03| 0.76| 0.00| 0.00| 0.00| 0.00;
OpenComputers                 | 0.14| 0.01| 1.37| 1.51| 0.06| 0.00| 0.00| 0.00;
Custom Loading Screen         | 2.41| 0.00| 0.00| 0.00| 0.00| 0.01| 0.00| 0.00;
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
 1.15: li.cil.oc.integration.jei.ModPluginOpenComputers;
 1.12: jeresources.jei.JEIConfig;
 0.77: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
 0.61: com.buuz135.industrial.jei.JEICustomPlugin;
 0.47: mezz.jei.plugins.vanilla.VanillaPlugin;
 0.46: crazypants.enderio.machines.integration.jei.MachinesPlugin;
 0.34: ic2.jeiIntegration.SubModule;
 0.26: crazypants.enderio.base.integration.jei.JeiPlugin;
 0.21: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
 0.19: knightminer.tcomplement.plugin.jei.JEIPlugin;
 0.17: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
 0.15: rustic.compat.jei.RusticJEIPlugin;
 1.79: Other
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
            text: '102.75s',
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
994400  1.42s Reloading;
001799  2.53s Loading Resource - AssetLibrary;
229900  3.38s Preloading 51437 textures;
179900  2.40s Texture loading;
00991C  4.35s Posting bake events;
009926 28.65s Setting up dynamic models;
009930 28.72s Loading Resource - ModelManager;
009996 29.77s Rendering Setup;
4F0099  1.41s XML Recipes;
590099  1.93s InterModComms;
990036 10.88s [VintageFix]: Texture search 70007 sprites;
99002C  3.55s Preloaded 33689 sprites
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
