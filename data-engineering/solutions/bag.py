import scipy.sparse
from sklearn.feature_extraction.text import CountVectorizer
import os

files = []
# Use os.walk() to recursively go through a directory's subfolders and files. 
for (dirpath, dirnames, filenames) in os.walk("/data/mini_newsgroups"):
    # os.path.join() is used instead of join("/") or join("\\") so the path
    # is OS agnostic.
    files.extend([os.path.join(dirpath, file) for file in filenames])
    
files = sorted(files)

# Use scikit-learn CountVectorizer. Because tokenizing a document can vary based
# on the token pattern, use the default tokenizer pattern from scikit-learn to
# simplify things.
count_vectorizer = CountVectorizer(input="filename", encoding='latin-1')

# fit() creates the dictionary mapping words to column indices. In this particular
# case, fit_transform() would work as well.
count_vectorizer.fit(files)

# transform() calculates the word counts for each email
count_matrix = count_vectorizer.transform(files)

# transform() does not ensure the columns are sorted alphabetically by word, so
# re-arrange the columns
sorted_words = sorted(count_vectorizer.vocabulary_.keys())
new_column_order = [count_vectorizer.vocabulary_[w] for w in sorted_words]
count_matrix = count_matrix[:, new_column_order]

# Write out npz file
scipy.sparse.save_npz('/data/count.npz', count_matrix)