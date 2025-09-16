// import { add } from 'common'

@Entry
@Component
struct HspView {
  @State num: number = 0

  add = (n:number,v: number) => {
    return n + v
  }

  build() {
    Column(){
      Text(String(this.num)).onClick(() => {
        this.num = this.add(1,1)
      })
    }
  }
}