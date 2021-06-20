def tuples_to_object(table, fields):  
    res = []
    for i in range(len(table)):
        temp = {}
        for k in range(len(fields)):
            if fields[k] == 'sells':
                temp[fields[k]] = int(table[i][k])
            else:
                temp[fields[k]] = table[i][k]
        res.append(temp)
        
    return res

def intersect_tables(table1, table2):
    table = []
    for el in table1:
        if el in table2:
            table.append(el)
    
    return table

def keepFirstMax(table):
    temp = []
    max = table[0][1]
    for i in range(len(table)):
        if table[i][1] != max:
            break
        temp.append(table[i])
    return temp