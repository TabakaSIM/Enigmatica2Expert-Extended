## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
249.63 sec
<br>
<sup><sub>(
4:9 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [103.51]},
      {label: 'FML stuff:', data: [146.12]}
    ]
  },
  options: {
    scales: {
      xAxes: [{display: false,stacked: true}],
      yAxes: [{display: false,stacked: true}],
    },
    elements: {rectangle: {borderWidth: 2}},
    legend: {display: false,},
    plugins: {datalabels: {color: 'white',formatter: (value, context) =>
      [context.dataset.label, value].join(' ')
    }}
  }
}"/>
</p>

<br>

# Mods Loading Time
<p align="center">
<img src="https://quickchart.io/chart?w=400&h=300&c={
  type: 'outlabeledPie',
  options: {
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
813e81   5.24s OpenComputers;
8f304e   5.21s Astral Sorcery;
516fa8   4.37s Ender IO;
a651a8   4.21s IndustrialCraft 2;
213664   2.70s Forestry;
cd922c   2.66s NuclearCraft;
5161a8   2.57s CraftTweaker2;
495797   6.99s CraftTweaker2 (Script Loading);
436e17   2.04s Integrated Dynamics;
ba3eb8   1.99s Cyclic;
308f7e   1.99s Quark: RotN Edition;
3e8160   1.87s The Twilight Forest;
649e21   1.75s OpenBlocks;
a86e51   1.73s Extra Utilities 2;
8c2ccd   1.68s Immersive Engineering;
8f4d30   1.59s Open Terrain Generator;
6e173d   1.53s Quantum Minecraft Dynamics;
3eb2ba   1.50s Botania;
3e68ba   1.30s AE2 Unofficial Extended Life;
61176e   1.28s Ice and Fire;
7c2ccd   1.23s Thaumic Augmentation;
444444   8.96s 8 Other mods;
333333  38.82s 136 'Fast' mods (load 1.0s - 0.1s);
222222   7.28s 298 'Instant' mods (load %3C 0.1s)
`
    .split(';').reduce((a, l) => {
      l.match(/(\w{6}) *(\d*\.\d*)s (.*)/)
      .slice(1).map((a, i) => [[String.fromCharCode(35),a].join(''), parseFloat(a), a][i])
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

# Top Mods Details (except JEI, FML and Forge)
<p align="center">
<img src="https://quickchart.io/chart?w=400&h=450&c={
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
1: Construction;
2: Loading Resources;
3: PreInitialization;
4: Initialization;
5: InterModComms$IMC;
6: PostInitialization;
7: LoadComplete;
8: ModIdMapping
`
    .split(';')
      .map(l => l.match(/\d: (.*)/).slice(1))
      .forEach(([name]) => a.datasets.push({ label: name, data: [] }));
`
                        1      2      3      4      5      6      7      8  ;
OpenComputers       |  0.13|  0.00|  3.59|  1.52|  0.00|  0.00|  0.00|  0.00;
Astral Sorcery      |  0.19|  0.00|  4.43|  0.58|  0.00|  0.00|  0.00|  0.00;
Ender IO            |  1.44|  0.01|  2.72|  0.21|  0.00|  0.00|  0.00|  0.00;
IndustrialCraft 2   |  0.69|  0.00|  3.03|  0.49|  0.00|  0.00|  0.00|  0.00;
Forestry            |  0.36|  0.00|  1.98|  0.35|  0.00|  0.00|  0.00|  0.00;
NuclearCraft        |  0.04|  0.00|  2.45|  0.17|  0.00|  0.00|  0.00|  0.00;
CraftTweaker2       |  0.09|  0.00|  2.48|  0.00|  0.00|  0.00|  0.00|  0.00;
Integrated Dynamics |  0.13|  0.00|  1.88|  0.03|  0.00|  0.00|  0.00|  0.00;
Cyclic              |  0.03|  0.00|  1.63|  0.33|  0.00|  0.00|  0.00|  0.00;
Quark: RotN Edition |  0.02|  0.00|  1.89|  0.07|  0.00|  0.00|  0.00|  0.00;
The Twilight Forest |  0.66|  0.00|  1.12|  0.10|  0.00|  0.00|  0.00|  0.00;
OpenBlocks          |  0.16|  0.00|  1.56|  0.03|  0.00|  0.00|  0.00|  0.00
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
<img src="https://quickchart.io/chart?w=700&c={
  options: {
    elements: { rectangle: { borderWidth: 1 } },
    legend: false
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
  1.79: jeresources.jei.JEIConfig;
  0.66: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.44: com.buuz135.industrial.jei.JEICustomPlugin;
  0.44: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.40: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.35: ic2.jeiIntegration.SubModule;
  0.21: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.17: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.16: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.16: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  0.09: zzzank.mod.jei_area_fixer.JEIAreaFixerJEIPlugin;
  0.09: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.08: net.bdew.jeibees.BeesJEIPlugin;
  0.06: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.06: lach_01298.qmd.jei.QMDJEI;
  1.19: Other 126 Plugins
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
<p align="center">
<img src="https://quickchart.io/chart?w=500&h=400&c={
  options: {
    rotation: Math.PI,
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
            text: [146.12,'s'].join(''),
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
993A00   0.23s Loading sounds;
994400   0.29s Loading Resource - SoundHandler;
444444 145.60s Other
`
    .split(';')
      .map(l => l.match(/(\w{6}) *(\d*\.\d*)s (.*)/))
      .forEach(([, col, time, name]) => {
        a.labels.push([name, ' ', time, 's'].join(''));
        a.datasets[0].data.push(parseFloat(time));
        a.datasets[0].backgroundColor.push([String.fromCharCode(35), col].join(''))
      })
      ; return a
  })()}
}"/>
</p>

<br>
