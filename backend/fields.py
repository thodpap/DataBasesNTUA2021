def tuples_to_object(table, fields):
    if len(table[0])!=len(fields):
        raise Exception("Wrong Fields")
    res = []
    for i in range(len(table)):
        temp = {}
        for k in range(len(fields)):
            if fields[k] == "sells":
                temp[fields[k]] = table[i][k]
            else:
                temp[fields[k]] = str(table[i][k])
        res.append(temp)
        
    return res
    
# table = [(1,"sdfa"), (2,"asfasf"), (3, "sfadsfaf"), (4, "q543tg")]
# fields = ["NFC_ID", "Name", "sasaaa"]
# print(tuples_to_object(table, fields))