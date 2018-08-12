import pandas as pd
import pandas.testing
import scipy.sparse

def csv_match(file1, file2, check_row_order=True):
    df1 = pd.read_csv(file1)
    df2 = pd.read_csv(file2)
    
    pandas.testing.assert_frame_equal(df1, df2, check_like=check_row_order)
    if check_row_order:
        # pandas.testing.assert_frame_equal(..., check_like=True, ...) allows
        # columns to be out of order, so double check column order.
        assert list(df1.columns) == list(df2.columns)
        
def sparse_npz_match(file1, file2):
    m1 = scipy.sparse.load_npz(file1)
    m2 = scipy.sparse.load_npz(file2)
    
    # It is more efficient to compare not equals for sparse matrices
    assert (m1 != m2).nnz == 0