
# Header template rule is an extension of template substitution rule
# That also makes this header a valid dependency for cc_library
# From https://stackoverflow.com/a/55407399
def header_template_rule_impl(ctx):
    ctx.actions.expand_template(
        template = ctx.file.src,
        output = ctx.outputs.out,
        substitutions = ctx.attr.substitutions,
    )
    return [
        # create a provider which says that this
        # out file should be made available as a header
        CcInfo(compilation_context = cc_common.create_compilation_context(

            # pass out the include path for finding this header
            system_includes = depset([ctx.attr.include, ctx.outputs.out.dirname, ctx.bin_dir.path]),

            # and the actual header here.
            headers = depset([ctx.outputs.out]),
        )),
    ]

header_template_rule = rule(
    attrs = {
        "include": attr.string(),
        "out": attr.output(mandatory = True),
        "src": attr.label(
            mandatory = True,
            allow_single_file = True,
        ),
        "substitutions": attr.string_dict(mandatory = True),
    },
    # output_to_genfiles is required for header files.
    output_to_genfiles = True,
    implementation = header_template_rule_impl,
)