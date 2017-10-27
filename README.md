repo with bazel bug reproduction
================================

```
➜ bazel version
Build label: 0.7.0-homebrew
Build target: bazel-out/darwin_x86_64-opt/bin/src/main/java/com/google/devtools/build/lib/bazel/BazelServer_deploy.jar
Build time: Thu Oct 19 09:12:48 2017 (1508404368)
Build timestamp: 1508404368
Build timestamp as int: 1508404368
```

```
➜ bazel build //my_package:a
..........
Unhandled exception thrown during build; message: Unrecoverable error while evaluating node 'SKYLARK_IMPORTS_LOOKUP://my_package:skylark.bzl' (requested by nodes 'PACKAGE:my_package')
INFO: Elapsed time: 0.346s
java.lang.RuntimeException: Unrecoverable error while evaluating node 'SKYLARK_IMPORTS_LOOKUP://my_package:skylark.bzl' (requested by nodes 'PACKAGE:my_package')
	at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:413)
	at com.google.devtools.build.lib.concurrent.AbstractQueueVisitor$WrappedRunnable.run(AbstractQueueVisitor.java:352)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
	at java.lang.Thread.run(Thread.java:745)
Caused by: java.lang.NullPointerException
	at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:770)
	at com.google.common.collect.ImmutableCollection$ArrayBasedBuilder.add(ImmutableCollection.java:477)
	at com.google.common.collect.ImmutableList$Builder.add(ImmutableList.java:758)
	at com.google.devtools.build.lib.syntax.FuncallExpression.evalArguments(FuncallExpression.java:682)
	at com.google.devtools.build.lib.syntax.FuncallExpression.invokeObjectMethod(FuncallExpression.java:725)
	at com.google.devtools.build.lib.syntax.FuncallExpression.doEval(FuncallExpression.java:710)
	at com.google.devtools.build.lib.syntax.Expression.eval(Expression.java:65)
	at com.google.devtools.build.lib.syntax.FuncallExpression.evalArguments(FuncallExpression.java:680)
	at com.google.devtools.build.lib.syntax.FuncallExpression.callFunction(FuncallExpression.java:740)
	at com.google.devtools.build.lib.syntax.FuncallExpression.doEval(FuncallExpression.java:713)
	at com.google.devtools.build.lib.syntax.Expression.eval(Expression.java:65)
	at com.google.devtools.build.lib.syntax.FuncallExpression.evalArguments(FuncallExpression.java:680)
	at com.google.devtools.build.lib.syntax.FuncallExpression.invokeObjectMethod(FuncallExpression.java:725)
	at com.google.devtools.build.lib.syntax.FuncallExpression.doEval(FuncallExpression.java:710)
	at com.google.devtools.build.lib.syntax.Expression.eval(Expression.java:65)
	at com.google.devtools.build.lib.syntax.DictionaryLiteral.doEval(DictionaryLiteral.java:75)
	at com.google.devtools.build.lib.syntax.Expression.eval(Expression.java:65)
	at com.google.devtools.build.lib.syntax.FuncallExpression.evalArguments(FuncallExpression.java:680)
	at com.google.devtools.build.lib.syntax.FuncallExpression.callFunction(FuncallExpression.java:740)
	at com.google.devtools.build.lib.syntax.FuncallExpression.doEval(FuncallExpression.java:713)
	at com.google.devtools.build.lib.syntax.Expression.eval(Expression.java:65)
	at com.google.devtools.build.lib.syntax.Eval.execAssignment(Eval.java:49)
	at com.google.devtools.build.lib.syntax.Eval.execDispatch(Eval.java:187)
	at com.google.devtools.build.lib.syntax.Eval.exec(Eval.java:178)
	at com.google.devtools.build.lib.syntax.BuildFileAST.execTopLevelStatement(BuildFileAST.java:226)
	at com.google.devtools.build.lib.skyframe.SkylarkImportLookupFunction.execAndExport(SkylarkImportLookupFunction.java:409)
	at com.google.devtools.build.lib.skyframe.SkylarkImportLookupFunction.createExtension(SkylarkImportLookupFunction.java:391)
	at com.google.devtools.build.lib.skyframe.SkylarkImportLookupFunction.computeInternal(SkylarkImportLookupFunction.java:221)
	at com.google.devtools.build.lib.skyframe.SkylarkImportLookupFunction.compute(SkylarkImportLookupFunction.java:88)
	at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:338)
	... 4 more
java.lang.RuntimeException: Unrecoverable error while evaluating node 'SKYLARK_IMPORTS_LOOKUP://my_package:skylark.bzl' (requested by nodes 'PACKAGE:my_package')
	at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:413)
	at com.google.devtools.build.lib.concurrent.AbstractQueueVisitor$WrappedRunnable.run(AbstractQueueVisitor.java:352)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
	at java.lang.Thread.run(Thread.java:745)
Caused by: java.lang.NullPointerException
	at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:770)
	at com.google.common.collect.ImmutableCollection$ArrayBasedBuilder.add(ImmutableCollection.java:477)
	at com.google.common.collect.ImmutableList$Builder.add(ImmutableList.java:758)
	at com.google.devtools.build.lib.syntax.FuncallExpression.evalArguments(FuncallExpression.java:682)
	at com.google.devtools.build.lib.syntax.FuncallExpression.invokeObjectMethod(FuncallExpression.java:725)
	at com.google.devtools.build.lib.syntax.FuncallExpression.doEval(FuncallExpression.java:710)
	at com.google.devtools.build.lib.syntax.Expression.eval(Expression.java:65)
	at com.google.devtools.build.lib.syntax.FuncallExpression.evalArguments(FuncallExpression.java:680)
	at com.google.devtools.build.lib.syntax.FuncallExpression.callFunction(FuncallExpression.java:740)
	at com.google.devtools.build.lib.syntax.FuncallExpression.doEval(FuncallExpression.java:713)
	at com.google.devtools.build.lib.syntax.Expression.eval(Expression.java:65)
	at com.google.devtools.build.lib.syntax.FuncallExpression.evalArguments(FuncallExpression.java:680)
	at com.google.devtools.build.lib.syntax.FuncallExpression.invokeObjectMethod(FuncallExpression.java:725)
	at com.google.devtools.build.lib.syntax.FuncallExpression.doEval(FuncallExpression.java:710)
	at com.google.devtools.build.lib.syntax.Expression.eval(Expression.java:65)
	at com.google.devtools.build.lib.syntax.DictionaryLiteral.doEval(DictionaryLiteral.java:75)
	at com.google.devtools.build.lib.syntax.Expression.eval(Expression.java:65)
	at com.google.devtools.build.lib.syntax.FuncallExpression.evalArguments(FuncallExpression.java:680)
	at com.google.devtools.build.lib.syntax.FuncallExpression.callFunction(FuncallExpression.java:740)
	at com.google.devtools.build.lib.syntax.FuncallExpression.doEval(FuncallExpression.java:713)
	at com.google.devtools.build.lib.syntax.Expression.eval(Expression.java:65)
	at com.google.devtools.build.lib.syntax.Eval.execAssignment(Eval.java:49)
	at com.google.devtools.build.lib.syntax.Eval.execDispatch(Eval.java:187)
	at com.google.devtools.build.lib.syntax.Eval.exec(Eval.java:178)
	at com.google.devtools.build.lib.syntax.BuildFileAST.execTopLevelStatement(BuildFileAST.java:226)
	at com.google.devtools.build.lib.skyframe.SkylarkImportLookupFunction.execAndExport(SkylarkImportLookupFunction.java:409)
	at com.google.devtools.build.lib.skyframe.SkylarkImportLookupFunction.createExtension(SkylarkImportLookupFunction.java:391)
	at com.google.devtools.build.lib.skyframe.SkylarkImportLookupFunction.computeInternal(SkylarkImportLookupFunction.java:221)
	at com.google.devtools.build.lib.skyframe.SkylarkImportLookupFunction.compute(SkylarkImportLookupFunction.java:88)
	at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:338)
	... 4 more
	```
