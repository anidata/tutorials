import csv
import os

files = []
# Use os.walk() to recursively go through a directory's subfolders and files. 
for (dirpath, dirnames, filenames) in os.walk("/data/mini_newsgroups"):
    # os.path.join() is used instead of join("/") or join("\\") so the path
    # is OS agnostic.
    files.extend([os.path.join(dirpath, file) for file in filenames])

# scikit-learn has an encoder to make this easier, so this just to illustrate
# how you could do it without scikit-learn.

# Using os.path.split() over split() for the same reason as os.path.join().
#
# In this case, we only need to do os.path.split() once because there is only
# only one level of folders.
labels = [os.path.split(filename)[0] for filename in files]

unique_labels = set(labels)
# Using a dictionary to convert label strings to an integer. list.index()
# technically works but is much slower. If you are interested read up on the
# differences between hashmaps (i.e. dictionaries) versus lists.
label_lookup = {l: i for i, l in enumerate(sorted(unique_labels))}

with open('/data/labels.csv', 'w') as fout:
    # Using the built-in CSV module to write out the data, you could also use
    # Pandas or another library of your choice.
    csvwriter = csv.writer(fout)
    
    # Writer the CSV header
    csvwriter.writerow('filename,label')
    
    for filename, label in zip(files, labels):
        csvwriter.writerow([filename, label_lookup[label]])