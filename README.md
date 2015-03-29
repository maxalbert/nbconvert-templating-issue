**Update:** This issue is mostly resolved now since `template_4.tplx` works correctly
(also see [this thread](http://mail.scipy.org/pipermail/ipython-dev/2015-March/016201.html)
on the ipython-dev mailing list for the related discussion).  However, it would be useful
to refactor some of the IPython/Jupyter nbconvert templates so that this can be achieved
more easily and with less copying & pasting of code.

------------------------------------------------------------

This repo illustrates an issue with nbconvert when trying to strip the "Out[]"
prompts from the output cells (e.g. in order to generate LaTeX reports that do
not appear to be produced from 'live' notebooks).

Type `make` to produces four PDF documents converted from `minimal_example.ipynb`,
each using one of the following nbconvert templates. (Alternatively, type
`BASENAME=sample_notebook make` to convert `sample_notebook.ipynb` instead).

  - template1.tplx:

    This contains just one line `((*- extends 'article.tplx' -*))` and serves
    as a reference, to check that it produces the same output as running
    `ipython nbconvert` without any custom templates.

  - template2.tplx:

    This extends `article.tplx` but also contains an exact copy of the `execute_result`
    block from the IPython template. If my understanding is correct, this should
    simply replace the definition in the original template file
    `Python/nbconvert/templates/latex/style_ipython.tplx`, so that the output
    should not change. However, for certain cells (e.g. the music image in the
    example notebook) this generates an *additional* "Out[]" prompt.

  - template3.tplx:

    This contains a modified copy of the `execute_result` block with all references
    to "Out" removed. Again, for some cells this works but for some cells it still
    generates an "Out[]" prompt.

  - template4.tplx:

    This template achieves what we want. However, it required copying & pasting
    various parts of other nbconvert templates, which is not ideal and may break
    if those templates get changed or rearranged.
