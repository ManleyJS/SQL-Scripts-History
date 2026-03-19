# The Snowpark package is required for Python Worksheets. 
# You can add more packages by selecting them using the Packages control and then importing them.

import snowflake.snowpark as snowpark
from snowflake.snowpark.functions import col

def main(session: snowpark.Session): 

#    sqlText = "use role useradmin"
#    print(sqlText)
#    dataframe = session.sql(sqlText).collect()

    #sql = f"select * from snowflake_sample_data.tpch_sf1.lineitem limit 20"
    #data = session.sql(sql).collect()
    #st.write(data)    # Your code goes here, inside the "main" handler.
    
    tableName = 'information_schema.packages'
    dataframe = session.table(tableName).filter(col("language") == 'python')

    # Print a sample of the dataframe to standard output.
    dataframe.show()

    # Return value will appear in the Results tab.
    return dataframe