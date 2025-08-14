import { Backlog } from '../pages/ToDoListPage'

@Component
export default struct ToDoItem {
  @Prop item: Backlog;
  build() {
    Row() {
      Text('111')
    }
  }
}