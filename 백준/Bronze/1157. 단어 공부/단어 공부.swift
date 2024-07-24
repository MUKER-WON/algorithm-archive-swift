var a = Dictionary(grouping: readLine()!.uppercased(), by: { $0 }).mapValues { $0.count }.sorted { $0.value > $1.value }
print(a.count==1 ? a[0].key : a[0].value==a[1].value ? "?" : a[0].key)