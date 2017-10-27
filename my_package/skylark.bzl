def _impl(ctx):
   pass

A = rule(
  implementation = _impl,
  attrs = {
    "source": attr.label(allow_single_file=True, default=Label("//{}:a.txt".format(native.package_name()))),
  },
)
