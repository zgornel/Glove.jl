# similar_words returns the n most similar words.
function similar_words{T}(M::Matrix{T}, vocab, id2word, word; n=10)
    c_id = vocab[word]

    dists = vec(M[:, c_id]' * M) / norm(M[:, c_id]) / norm(M, 1)
    
    sorted_ids = sortperm(dists, rev=true)[1:n+1]
    sim_words = String[]

    for id = sorted_ids
        if c_id == id
            continue
        end
        word = id2word[id]
        push!(sim_words, word)
    end
    sim_words
end
