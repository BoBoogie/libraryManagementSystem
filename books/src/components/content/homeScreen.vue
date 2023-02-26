<template>
  <div class="homeScreen">
    <main-top-bar classify="首页"></main-top-bar>
    <el-card class="detail">
      <el-row :gutter="20">
        <el-col :span="18">
          <el-card class="readerAgeDistribution"></el-card>
        </el-col>
        <el-col :span="6">
          <el-card class="readerGenderDistribution"></el-card>
        </el-col>
      </el-row>
      <el-row>
        <el-col>
          <el-card class="bookClassification"></el-card>
        </el-col>
      </el-row>
    </el-card>
  </div>
</template>

<script>
import mainTopBar from "@/components/common/mainTopBar.vue";
import * as echarts from 'echarts';

export default {
  name: 'HomeScreen',
  data() {
    return {
      bookClass: ['软件类', '管理类', '科普类', "生物类", '硬件类', '数学类'],
      quantity: [],
      softClass: [],
      manageClass: [],
      popularClass: [],
      biologyClass: [],
      hardwareClass: [],
      mathClass: [],
      studentInfo: [],
      maleClass: [],
      femaleClass: [],
      nineteenClass: [],
      twentyClass: [],
      twentyOneClass: [],
      twentyTwoClass: [],
    }
  },
  components: { mainTopBar },
  mounted() {
    this.getBookClassification()
    this.getReaderGenderDistribution()
    this.getReaderAgeDistribution()
  },
  methods: {
    getSingleQuantity(singleClass) {
      return (singleClass.length)
    },
    getBookClassification() {
      this.$axios.get('/admin/allbooksinfo')
          .then(res => {
            for (let key in res.data.data) {
              this.quantity.push(res.data.data[key])
            }
            this.softClass = this.quantity.filter((item) => {
              return item.bookid.slice(0, 1) === 'A'
            })
            this.manageClass = this.quantity.filter((item) => {
              return item.bookid.slice(0, 1) === 'B'
            })
            this.popularClass = this.quantity.filter((item) => {
              return item.bookid.slice(0, 1) === 'C'
            })
            this.biologyClass = this.quantity.filter((item) => {
              return item.bookid.slice(0, 1) === 'D'
            })
            this.hardwareClass = this.quantity.filter((item) => {
              return item.bookid.slice(0, 1) === 'E'
            })
            this.mathClass = this.quantity.filter((item) => {
              return item.bookid.slice(0, 1) === 'F'
            })

            let dom = document.querySelector('.bookClassification');
            let mycharts = echarts.init(dom);
            mycharts.setOption({
              dataZoom: {},
              title: {
                text: "图书分类",
                textStyle: {
                  color: '#3d3b3b',
                  fontFamily: "微软雅黑 Light",
                  textShadow: '0 10px 10px rgb(10, 77, 165)'
                }
              },
              xAxis: {
                data: this.bookClass
              },
              yAxis: {},
              series: [
                {
                  type: "bar",
                  data: [
                    {
                      name: this.bookClass[0],
                      value: this.getSingleQuantity(this.softClass),
                      itemStyle: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                          { offset: 0, color: '#FF8D54' },
                          { offset: 0.5, color: '#F7775C' },
                          { offset: 1, color: '#E6615E' }
                        ])
                      },
                      emphasis: {
                        itemStyle: {
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            { offset: 0, color: '#E6615E' },
                            { offset: 0.7, color: '#F7775C' },
                            { offset: 1, color: '#FF8D54' }
                          ]),
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)',
                        }
                      }
                    },
                    {
                      name: this.bookClass[1],
                      value: this.getSingleQuantity(this.manageClass),
                      itemStyle: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                          { offset: 0, color: '#FFF64D' },
                          { offset: 0.5, color: '#F7DE54' },
                          { offset: 1, color: '#E5BF56' }
                        ])
                      },
                      emphasis: {
                        itemStyle: {
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            { offset: 0, color: '#E5BF56' },
                            { offset: 0.7, color: '#F7DE54' },
                            { offset: 1, color: '#FFF64D' }
                          ]),
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)',
                        }
                      }
                    },
                    {
                      name: this.bookClass[2],
                      value: this.getSingleQuantity(this.popularClass),
                      itemStyle: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                          { offset: 0, color: '#42FFBF' },
                          { offset: 0.5, color: '#4AF788' },
                          { offset: 1, color: '#4FE557' }
                        ])
                      },
                      emphasis: {
                        itemStyle: {
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            { offset: 0, color: '#4FE557' },
                            { offset: 0.7, color: '#4AF788' },
                            { offset: 1, color: '#42FFBF' }
                          ]),
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)',
                        }
                      }
                    },
                    {
                      name: this.bookClass[3],
                      value: this.getSingleQuantity(this.biologyClass),
                      itemStyle: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                          { offset: 0, color: '#58D9F5' },
                          { offset: 0.5, color: '#5BB1FC' },
                          { offset: 1, color: '#5E80E5' }
                        ])
                      },
                      emphasis: {
                        itemStyle: {
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            { offset: 0, color: '#5E80E5' },
                            { offset: 0.7, color: '#5BB1FC' },
                            { offset: 1, color: '#58D9F5' }
                          ]),
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)',
                        }
                      }
                    },
                    {
                      name: this.bookClass[4],
                      value: this.getSingleQuantity(this.hardwareClass),
                      itemStyle: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                          { offset: 0, color: '#DB52E6' },
                          { offset: 0.5, color: '#BD4EFC' },
                          { offset: 1, color: '#864CF5' }
                        ])
                      },
                      emphasis: {
                        itemStyle: {
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            { offset: 0, color: '#864CF5' },
                            { offset: 0.7, color: '#BD4EFC' },
                            { offset: 1, color: '#DB52E6' }
                          ]),
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)',
                        }
                      }
                    },
                    {
                      name: this.bookClass[5],
                      value: this.getSingleQuantity(this.mathClass),
                      itemStyle: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                          { offset: 0, color: '#FC6C26' },
                          { offset: 0.5, color: '#EA4C2D' },
                          { offset: 1, color: '#D41F1E' }
                        ])
                      },
                      emphasis: {
                        itemStyle: {
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            { offset: 0, color: '#D41F1E' },
                            { offset: 0.7, color: '#EA4C2D' },
                            { offset: 1, color: '#FC6C26' },
                          ]),
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)',
                        }
                      }
                    },

                  ],

                },

              ]
              ,
              //提示组件
              tooltip: {
                //提示框文字的颜色
                textStyle: {
                  color: "skyblue"
                }
              },
              //系列切换组件
              legend: {
                orient: 'vertical',
              },
              //工具栏组件
              toolbox: {
                show: true,
                feature: {
                  saveAsImage: {},
                  dataZoom: {
                    yAxisIndex: "none"
                  },
                  dataView: {
                    readOnly: false
                  },
                  restore: {},

                }
              },
              //调整图标布局
              grid: {
                left: 30,
                right: 0,
              }
            })
          })
          .catch(err => console.log(err))
    },
    getReaderGenderDistribution() {
      this.$axios.get('/student/getallstudent')
          .then(res => {
            for (let key in res.data.data) {
              this.studentInfo.push(res.data.data[key])
            }
            this.maleClass = this.studentInfo.filter(item => {
              return item.gender === '男'
            })
            this.femaleClass = this.studentInfo.filter(item => {
              return item.gender === '女'
            })
            let dom = document.querySelector('.readerGenderDistribution');
            let mycharts = echarts.init(dom);
            mycharts.setOption({
              title: {
                text: '读者分布',
                subtext: '男/女',
                left: 'center',
                textStyle: {
                  color: '#3d3b3b',
                  fontFamily: "微软雅黑 Light",
                  textShadow: '0 10px 10px rgb(10, 77, 165)'
                }

              },
              tooltip: {
                trigger: 'item'
              },
              legend: {
                orient: 'vertical',
                left: 'left'
              },
              series: [
                {
                  name: '读者分布',
                  type: 'pie',
                  radius: '50%',
                  data: [
                    {
                      value: this.maleClass.length,
                      name: '男',
                      itemStyle: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                          { offset: 0, color: '#DB52E6' },
                          { offset: 0.5, color: '#BD4EFC' },
                          { offset: 1, color: '#864CF5' }
                        ])
                      },
                      emphasis: {
                        itemStyle: {
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            { offset: 0, color: '#864CF5' },
                            { offset: 0.7, color: '#BD4EFC' },
                            { offset: 1, color: '#DB52E6' }
                          ]),
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)',
                        }
                      }
                    },
                    {
                      value: this.femaleClass.length,
                      name: '女',
                      itemStyle: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                          { offset: 0, color: '#FFF64D' },
                          { offset: 0.5, color: '#F7DE54' },
                          { offset: 1, color: '#E5BF56' }
                        ])
                      },
                      emphasis: {
                        itemStyle: {
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            { offset: 0, color: '#E5BF56' },
                            { offset: 0.7, color: '#F7DE54' },
                            { offset: 1, color: '#FFF64D' }
                          ]),
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)',
                        }
                      }
                    }
                  ],
                }
              ]
            });
            console.log(res)
          })
          .catch(err => console.log(err))
    },
    getReaderAgeDistribution() {
      this.$axios.get('/student/getallstudent')
          .then(res => {
            for (let key in res.data.data) {
              this.studentInfo.push(res.data.data[key])
            }
            this.nineteenClass = this.studentInfo.filter((item) => {
              return item.class.slice(0, 4) === '2019'
            })
            this.twentyClass = this.studentInfo.filter((item) => {
              return item.class.slice(0, 4) === '2020'
            })
            this.twentyOneClass = this.studentInfo.filter((item) => {
              return item.class.slice(0, 4) === '2021'
            })
            this.twentyTwoClass = this.studentInfo.filter((item) => {
              return item.class.slice(0, 4) === '2022'
            })
            let dom = document.querySelector('.readerAgeDistribution');
            let mycharts = echarts.init(dom);
            mycharts.setOption({
              title: {
                text: '读者分布',
                subtext: '年级',
                left: 'center',
                textStyle: {
                  color: '#3d3b3b',
                  fontFamily: "微软雅黑 Light",
                  textShadow: '0 10px 10px rgb(10, 77, 165)'
                }
              },
              grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
              },
              xAxis: {
                type: "value",
                axisLabel: {
                  formatter: "{value} ",
                }
              },
              yAxis: {
                type: 'category',
                data: ['2019级', '2020级', '2021级', '2022级']
              },
              series: [
                {
                  name:'读者分布',
                  type: 'bar',
                  showBackground: true,
                  backgroundStyle: {
                    color: 'rgba(180, 180, 180, 0.2)'
                  },
                  data: [
                    {
                      value: this.nineteenClass.length,
                      name: '2019级',
                      itemStyle: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                          { offset: 0, color: '#42FFBF' },
                          { offset: 0.5, color: '#4AF788' },
                          { offset: 1, color: '#4FE557' }
                        ])
                      },
                      emphasis: {
                        itemStyle: {
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            { offset: 0, color: '#4FE557' },
                            { offset: 0.7, color: '#4AF788' },
                            { offset: 1, color: '#42FFBF' }
                          ]),
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)',
                        }
                      }
                    },
                    {
                      value: this.twentyClass.length,
                      name: '2020级',
                      itemStyle: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                          { offset: 0, color: '#DB52E6' },
                          { offset: 0.5, color: '#BD4EFC' },
                          { offset: 1, color: '#864CF5' }
                        ])
                      },
                      emphasis: {
                        itemStyle: {
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            { offset: 0, color: '#864CF5' },
                            { offset: 0.7, color: '#BD4EFC' },
                            { offset: 1, color: '#DB52E6' }
                          ]),
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)',
                        }
                      }
                    },
                    {
                      value: this.twentyOneClass.length,
                      name: '2021级',
                      itemStyle: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                          { offset: 0, color: '#58D9F5' },
                          { offset: 0.5, color: '#5BB1FC' },
                          { offset: 1, color: '#5E80E5' }
                        ])
                      },
                      emphasis: {
                        itemStyle: {
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            { offset: 0, color: '#5E80E5' },
                            { offset: 0.7, color: '#5BB1FC' },
                            { offset: 1, color: '#58D9F5' }
                          ]),
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)',
                        }
                      }
                    },
                    {
                      value: this.twentyTwoClass.length,
                      name: '2022级',
                      itemStyle: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                          { offset: 0, color: '#FFF64D' },
                          { offset: 0.5, color: '#F7DE54' },
                          { offset: 1, color: '#E5BF56' }
                        ])
                      },
                      emphasis: {
                        itemStyle: {
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            { offset: 0, color: '#E5BF56' },
                            { offset: 0.7, color: '#F7DE54' },
                            { offset: 1, color: '#FFF64D' }
                          ]),
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)',
                        }
                      }
                    },
                  ],
                },
              ],
              tooltip: {
                trigger: 'axis',
                triggerOn:"mousemove",
                axisPointer: {
                  type: 'shadow'
                }
              }
            })
          })
    },
  }
}
</script>

<style scoped>
.detail {
  height: 100%;
  overflow: auto;
}

.readerAgeDistribution {
  padding: 15px 10px 15px 10px;
  height: 190px;
}

.readerGenderDistribution {
  height: 205px;
  padding: 15px 10px 0 10px;
}

.bookClassification {
  height: 360px;
  padding: 10px;
  margin-top: 20px;

}
</style>
