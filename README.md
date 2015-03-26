This repo illustrates an issue with nbconvert when trying to strip the "Out[]"
prompts from the output cells (e.g. in order to generate LaTeX reports that do
not appear to be produced from 'live' notebooks).

There are three templates for nbconvert illustrating the issue. Type 'make' to
produce three PDF documents using each of these templates.

  - template1.tplx:

    This contains just one line `((*- extends 'article.tplx' -*))` and serves
    as a reference, to check that it produces the same output as running
    `ipython nbconvert` without any custom templates.

  - template2.tplx:

    This extends 'article.tplx' but also contains an exact copy of the 'execute_result'
    block from the IPython repository. If my understanding is correct, this should
    simply replace the definition in the original template file
    `Python/nbconvert/templates/latex/style_ipython.tplx`, so that the output
    should not change. However, for certain cells (e.g. the music image in the
    example notebook) this generates an *additional* "Out[]" prompt.

  - template3.tplx:

    This contains a modified copy of the 'execute_result' block with all references
    to "Out" removed. Again, for some cells this works but for some cells it still
    generates an "Out[]" prompt.
