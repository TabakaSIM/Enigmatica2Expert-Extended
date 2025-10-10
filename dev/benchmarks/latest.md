## Minecraft load time benchmark

---

<p align="center" style="font-size:160%;">
MC total load time:<br>
297 sec
<br>
<sup><sub>(
4:57 min
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
        {label: 'Construction\n', data: [58.00]},
        {label: 'PreInit\n', data: [149.00]},
        {label: 'Init\n', data: [61.00]},
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
8f304e  9.22s Astral Sorcery;
436e17  8.81s Had Enough Items;
395E14  1.15s [JEI Ingredient Filter];
395E14  7.89s [JEI Plugins];
5161a8  7.42s CraftTweaker2;
516fa8  6.87s Ender IO;
6e5e17  6.60s Tinkers' Antique;
5E5014  5.00s [TCon Textures];
813e81  6.23s OpenComputers;
a651a8  5.68s IndustrialCraft 2;
cd922c  4.08s NuclearCraft;
213664  3.23s Forestry;
3e7d81  3.21s ProbeZS;
6e175e  3.13s Recurrent Complex;
216364  2.51s Thermal Expansion;
436e17  2.49s Integrated Dynamics;
3e8160  2.42s The Twilight Forest;
a86e51  2.33s Extra Utilities 2;
ba3eb8  2.21s Cyclic;
444444 45.14s 30 Other mods;
333333 43.38s 148 'Fast' mods (1.0s - 0.1s);
222222  7.56s 285 'Instant' mods (%3C 0.1s)
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
Astral Sorcery                | 0.17| 0.00| 7.71| 1.33| 0.00| 0.00| 0.00| 0.00;
CraftTweaker2                 | 0.11| 0.00| 2.67| 4.58| 0.00| 0.06| 0.00| 0.00;
Ender IO                      | 1.69| 0.01| 3.08| 0.40| 1.66| 0.00| 0.03| 0.00;
Tinkers' Antique              | 0.72| 0.01| 0.10| 0.77| 0.00| 0.00| 0.00| 5.00;
OpenComputers                 | 0.14| 0.01| 4.16| 1.87| 0.06| 0.00| 0.00| 0.00;
IndustrialCraft 2             | 0.95| 0.01| 3.81| 0.92| 0.00| 0.00| 0.00| 0.00;
NuclearCraft                  | 0.05| 0.01| 3.10| 0.89| 0.00| 0.00| 0.03| 0.00;
Forestry                      | 0.29| 0.01| 2.10| 0.84| 0.00| 0.00| 0.00| 0.00;
ProbeZS                       | 0.02| 0.00| 0.06| 3.13| 0.00| 0.00| 0.00| 0.00;
Recurrent Complex             | 0.17| 0.00| 0.31| 2.66| 0.00| 0.00| 0.00| 0.00;
[Mod Average]                 | 0.07| 0.00| 0.18| 0.09| 0.00| 0.01| 0.00| 0.01
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
 1.40: li.cil.oc.integration.jei.ModPluginOpenComputers;
 0.99: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
 0.76: jeresources.jei.JEIConfig;
 0.64: ic2.jeiIntegration.SubModule;
 0.61: com.buuz135.industrial.jei.JEICustomPlugin;
 0.52: crazypants.enderio.machines.integration.jei.MachinesPlugin;
 0.46: mezz.jei.plugins.vanilla.VanillaPlugin;
 0.18: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
 0.18: crazypants.enderio.base.integration.jei.JeiPlugin;
 0.16: knightminer.tcomplement.plugin.jei.JEIPlugin;
 0.16: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
 0.14: rustic.compat.jei.RusticJEIPlugin;
 1.70: Other
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
            text: '111.11s',
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
994400  1.47s Reloading;
001799  5.34s Loading Resource - AssetLibrary;
369900  1.10s CCL ModelLoading: Blocks;
229900  3.56s Preloading 50932 textures;
179900  1.79s Texture loading;
00991C  4.59s Posting bake events;
009926 32.38s Setting up dynamic models;
009930 32.47s Loading Resource - ModelManager;
009996 33.44s Rendering Setup;
440099  1.61s XML Recipes;
4F0099  2.11s InterModComms;
99007D 11.67s [VintageFix]: Texture search 68465 sprites;
990073  3.68s Preloaded 33184 sprites
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
