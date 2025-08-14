import ToDoItem from '../view/TODOItem'

export class Backlog {
  id: string;
  title: string;
  accomplish: boolean;
  constructor(id: string, title: string, accomplish: boolean) {
    this.id = id;
    this.title = title;
    this.accomplish = accomplish;
  }
}

@Entry
@Component
struct Index {
  private totalTasks:Array<Backlog> = []

  build() {
    Column() {
      Text($r('app.string.page_title'))
        .fontSize(36)
        .fontWeight(800)
      ForEach(this.totalTasks, (item: Backlog) => {
        ToDoItem({item: item})
      }, (item: Backlog) => item.id)
    }
    .padding(20)
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F1F4')
  }
}