import python
import semmle.python.dataflow.DataFlow

/**
 * eval() にユーザー入力が渡されている危険なケースを検出する
 */
class EvalSink extends DataFlow::SinkNode {
  EvalSink() {
    this.asExpr() instanceof BuiltinCall and
    this.asExpr().getCallee().getName() = "eval"
  }
}

class UserInputSource extends DataFlow::SourceNode {
  UserInputSource() {
    this.asExpr() instanceof Call and
    this.asExpr().getCallee().getName() = "input"
  }
}

from UserInputSource src, EvalSink sink
where DataFlow::localFlow(src, sink)
select sink, "ユーザー入力が eval に渡されています。危険です。"
