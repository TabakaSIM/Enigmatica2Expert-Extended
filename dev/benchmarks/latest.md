## Minecraft load time benchmark

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
273 sec
<br>
<sup><sub>(
4:33 min
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
        {label: 'Mixins\n', data: [31.00]},
        {label: 'Construction\n', data: [59.00]},
        {label: 'PreInit\n', data: [127.00]},
        {label: 'Init\n', data: [53.00]},
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
          value: 31,
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
436e17  8.42s Had Enough Items;
395E14  0.98s [JEI Ingredient Filter];
395E14  7.53s [JEI Plugins];
8f304e  7.01s Astral Sorcery;
5161a8  6.99s CraftTweaker2;
516fa8  6.06s Ender IO;
a651a8  5.85s IndustrialCraft 2;
6e5e17  4.77s Tinkers' Antique;
5E5014  3.00s [TCon Textures];
cd922c  3.54s NuclearCraft;
213664  3.43s Forestry;
6e175e  3.28s Recurrent Complex;
813e81  3.27s OpenComputers;
ba3eb8  2.30s Cyclic;
306e8f  2.24s Custom Loading Screen;
308f7e  2.20s Quark: RotN Edition;
436e17  2.17s Integrated Dynamics;
3e8160  2.14s The Twilight Forest;
3e7d81  2.12s ProbeZS;
444444 31.17s 21 Other mods;
333333 47.61s 153 'Fast' mods (1.0s - 0.1s);
222222  8.08s 296 'Instant' mods (%3C 0.1s)
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
Astral Sorcery                | 0.17| 0.00| 5.50| 1.33| 0.00| 0.00| 0.00| 0.00;
CraftTweaker2                 | 0.16| 0.00| 2.85| 3.94| 0.00| 0.04| 0.00| 0.00;
Ender IO                      | 1.63| 0.01| 2.68| 0.32| 1.42| 0.00| 0.01| 0.00;
IndustrialCraft 2             | 1.47| 0.01| 3.58| 0.80| 0.00| 0.00| 0.00| 0.00;
Tinkers' Antique              | 0.75| 0.01| 0.12| 0.90| 0.00| 0.00| 0.00| 3.00;
NuclearCraft                  | 0.05| 0.01| 2.69| 0.76| 0.00| 0.00| 0.03| 0.00;
Forestry                      | 0.46| 0.01| 2.14| 0.83| 0.00| 0.00| 0.00| 0.00;
Recurrent Complex             | 0.16| 0.00| 0.30| 2.82| 0.00| 0.00| 0.00| 0.00;
OpenComputers                 | 0.20| 0.01| 1.38| 1.63| 0.05| 0.00| 0.00| 0.00;
Cyclic                        | 0.05| 0.01| 1.82| 0.42| 0.00| 0.00| 0.00| 0.00;
[Mod Average]                 | 0.07| 0.00| 0.15| 0.07| 0.00| 0.00| 0.00| 0.01
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
 1.45: li.cil.oc.integration.jei.ModPluginOpenComputers;
 0.87: jeresources.jei.JEIConfig;
 0.73: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
 0.59: com.buuz135.industrial.jei.JEICustomPlugin;
 0.48: crazypants.enderio.machines.integration.jei.MachinesPlugin;
 0.45: mezz.jei.plugins.vanilla.VanillaPlugin;
 0.38: ic2.jeiIntegration.SubModule;
 0.32: knightminer.tcomplement.plugin.jei.JEIPlugin;
 0.18: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
 0.18: crazypants.enderio.base.integration.jei.JeiPlugin;
 0.14: rustic.compat.jei.RusticJEIPlugin;
 0.14: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
 1.61: Other
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
            text: '109.08s',
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
994400  1.51s Reloading;
001799  3.49s Loading Resource - AssetLibrary;
229900  3.15s Preloading 51437 textures;
179900  1.67s Texture loading;
00991C  4.57s Posting bake events;
009926 28.52s Setting up dynamic models;
009930 28.59s Loading Resource - ModelManager;
009996 30.18s Rendering Setup;
4F0099  1.36s XML Recipes;
590099  1.83s InterModComms;
99007D 11.48s [VintageFix]: Texture search 70018 sprites;
990073  3.25s Preloaded 33689 sprites
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
