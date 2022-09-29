import { Line } from 'react-chartjs-2';
import React from 'react';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';
ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend
);

export function LinerGraph({ data }: { data: any }) {
  const options = {
    responsive: false,
    maintainAspectRatio: false,
    interaction: {
      //mode: 'index' as const,
      intersect: false,
    },
    aspectRatio: 2,
    plugins: {
      tooltip: {
        itemSort: function(b: any, a: any) {
          return b.raw - a.raw;
        }
      },
      legend: {
        labels: {
          boxWidth: 20
        }
      }
    },
    scales: {
      y: {
        reverse: true,
        max: 10,
      },
      x: {
        reverse: true,
      }
    }
  };

  function trimTitle(title: string){
    if (title.indexOf(' / ') != -1){return title.split(" / ")[0]} 
    if (title.indexOf("3DMV") >= 0){
      return title.split("』")[0].split("『")[1]
    }
    return title;
  }

  function genGraphData(data: any): {
    labels: string[];
    datasets: {
      label: string;
      data: number[];
    }[];
  } {
    const keys = Object.keys(data)
    const labels: string[] = []; 
    var dt = new Date();
    var enddt = new Date();
    dt.setDate(dt.getDate() - data[keys[0]].length);
    var start = dt;
    for(var d = start; d < enddt; d.setDate(d.getDate()+1)) {
      const strDate = (d.getMonth() + 1) + "/" + d.getDate() 
      labels.push(strDate)
    }
    const backgroundColor = [
      "rgba(255, 99, 132, 0.2)",
      "rgba(54, 162, 235, 0.2)",
      "rgba(255, 206, 86, 0.2)",
      "rgba(75, 192, 192, 0.2)",
      "rgba(153, 102, 255, 0.2)",
      "rgba(255, 159, 64, 0.2)",
      "rgba(155, 99, 132, 0.2)",
      "rgba(54, 62, 235, 0.2)",
      "rgba(255, 106, 86, 0.2)",
      "rgba(75, 92, 192, 0.2)",
      "rgba(153, 102, 55, 0.2)",
      "rgba(155, 159, 64, 0.2)",
      "rgba(175, 192, 192, 0.2)",
      "rgba(153, 12, 255, 0.2)",
      "rgba(25, 99, 132, 0.2)",
      "rgba(54, 162, 35, 0.2)",
      "rgba(2, 206, 86, 0.2)",
      "rgba(75, 19, 192, 0.2)",
      "rgba(153, 102, 25, 0.2)",
      "rgba(25, 159, 64, 0.2)",
      "rgba(155, 99, 12, 0.2)",
    ]
    const borderColor = [
      "rgba(255, 99, 132, 0.6)",
      "rgba(54, 162, 235, 0.6)",
      "rgba(255, 206, 86, 0.6)",
      "rgba(75, 192, 192, 0.6)",
      "rgba(153, 102, 255, 0.6)",
      "rgba(255, 159, 64, 0.6)",
      "rgba(155, 99, 132, 0.6)",
      "rgba(54, 62, 235, 0.6)",
      "rgba(255, 106, 86, 0.6)",
      "rgba(75, 92, 192, 0.6)",
      "rgba(153, 102, 55, 0.6)",
      "rgba(155, 159, 64, 0.6)",
      "rgba(175, 192, 192, 0.6)",
      "rgba(153, 12, 255, 0.6)",
      "rgba(25, 99, 132, 0.6)",
      "rgba(54, 162, 35, 0.6)",
      "rgba(2, 206, 86, 0.6)",
      "rgba(75, 19, 192, 0.6)",
      "rgba(153, 102, 25, 0.6)",
      "rgba(25, 159, 64, 0.6)",
      "rgba(155, 99, 12, 0.6)",
    ]
    
    const datasets: any = []
    keys.forEach((key: string, i: number)=> {
      datasets.push({
        label: trimTitle(key),
        data: data[key],
        borderColor: borderColor[i],
        backgroundColor: backgroundColor[i],
        tension: 0.2
      })
    })

    const graphData = {
      labels,
      datasets,
    }
    return graphData
  }

  return (
    <>
      <Line options={options} width={980} height={340} data={genGraphData(data)} />
    </>
  )
}