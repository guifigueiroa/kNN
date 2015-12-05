function D = cosine_similarity(A,B)
    D = dot(A,B)/(norm(A)*norm(B));
end