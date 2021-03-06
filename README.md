Glove
-----

[![Build Status](https://travis-ci.org/domluna/Glove.jl.svg?branch=master)](https://travis-ci.org/domluna/GloVe.jl)
[![Coverage Status](https://coveralls.io/repos/domluna/Glove.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/domluna/Glove.jl?branch=master)

Implements [Global Word Vectors](http://nlp.stanford.edu/projects/glove/).

```
using Pkg
Pkg.add("https://github.com/domluna/Glove.jl.git")
```

See `benchmark/perf.jl` for a usage example.

Here's the rough idea:

1. Take text and make a LookupTable. This is a dictionary that has a map
from words -> ids and vice-versa. Preprocessing steps should be taken
prior to this.

2. Use `weightedsums` to get the weighted co-occurence sum totals. This returns
a `CooccurenceDict`.

3. Convert the `CooccurenceDict` to a `CooccurenceVector`. The reasoning for this is faster indexing when we train the model.

4. Initialize a `Model` and train the model with the `CooccurenceVector` using
the `agagrad!` method.

It's pretty fast at this point. On a single core it's roughly 3x slower than the optimized C version.

### TODO

* [  ] More docs.

* [  ] See if precompile(args...) does anything

* [  ] Notebook example ( has to have emojis )

* [  ] Multi-threading
