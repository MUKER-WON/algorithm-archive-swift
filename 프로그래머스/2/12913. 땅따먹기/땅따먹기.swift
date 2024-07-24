func solution(_ land:[[Int]]) -> Int{
    var myland = land
    for i in 1..<myland.count {
        myland[i][0] += max(myland[i-1][1], myland[i-1][2], myland[i-1][3])
        myland[i][1] += max(myland[i-1][0], myland[i-1][2], myland[i-1][3])
        myland[i][2] += max(myland[i-1][0], myland[i-1][1], myland[i-1][3])
        myland[i][3] += max(myland[i-1][0], myland[i-1][1], myland[i-1][2])
    }
    return myland.last!.max()!
}