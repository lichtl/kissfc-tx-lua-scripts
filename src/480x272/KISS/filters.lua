return {
    read = 0x47,
    write = 0x48,
    postRead = function(values)
        local ret = {}
        ret[1] = values[3] + 1
        ret[2] = bit32.lshift(values[4], 8) + values[5]
        ret[3] = bit32.lshift(values[6], 8) + values[7]
        ret[4] = values[8] + 1
        ret[5] = bit32.lshift(values[9], 8) + values[10]
        ret[6] = bit32.lshift(values[11], 8) + values[12]
        ret[7] = values[1] + 1
        ret[8] = values[2]
        ret[9] = values[13] + 1
        ret[10] = values[14] + 1
        return ret
    end,
    preWrite = function(values)
        local ret = {}
        ret[1] = bit32.band(values[7] - 1, 0xFF)
        ret[2] = bit32.band(values[8], 0xFF)
        ret[3] = bit32.band(values[1] - 1, 0xFF)
        ret[4] = bit32.band(bit32.rshift(values[2], 8), 0xFF)
        ret[5] = bit32.band(values[2], 0xFF)
        ret[6] = bit32.band(bit32.rshift(values[3], 8), 0xFF)
        ret[7] = bit32.band(values[3], 0xFF)
        ret[8] = bit32.band(values[4] - 1, 0xFF)
        ret[9] = bit32.band(bit32.rshift(values[5], 8), 0xFF)
        ret[10] = bit32.band(values[5], 0xFF)
        ret[11] = bit32.band(bit32.rshift(values[6], 8), 0xFF)
        ret[12] = bit32.band(values[6], 0xFF)
        ret[13] = bit32.band(values[9] - 1, 0xFF)
        ret[14] = bit32.band(values[10] - 1, 0xFF)
        return ret
    end,
    title = 'Filters',
    text = {
        {t = 'Notch Filter', x = 113, y = 68},
        {t = 'Center', x = 220, y = 68},
        {t = 'Cutoff', x = 300, y = 68},
        {t = 'Roll', x = 35, y = 96},
        {t = 'Pitch', x = 35, y = 124},
        {t = 'Roll/Pitch LPF', x = 35, y = 158},
        {t = 'Yaw filter', x = 220, y = 158},
        {t = 'Yaw LPF', x = 35, y = 186},
        {t = 'Dterm LPF', x = 220, y = 186}
    },
    fields = {
        -- Filters
        {x = 139, y = 96, i = 1, min = 1, max = 2, table = {'Off', 'On'}},
        {x = 219, y = 96, i = 2, min = 0, max = 490},
        {x = 299, y = 96, i = 3, min = 0, max = 490},
        {x = 139, y = 124, i = 4, min = 1, max = 2, table = {'Off', 'On'}},
        {x = 219, y = 124, i = 5, min = 0, max = 490},
        {x = 299, y = 124, i = 6, min = 0, max = 490},
        {
            x = 139,
            y = 158,
            i = 7,
            min = 1,
            max = 7,
            table = {'Off', 'High', 'Med. High', 'Medium', 'Med. Low', 'Low', 'Very Low'}
        },
        {x = 299, y = 158, i = 8, min = 0, max = 97},
        {
            x = 139,
            y = 186,
            i = 9,
            min = 1,
            max = 7,
            table = {'Off', 'High', 'Med. High', 'Medium', 'Med. Low', 'Low', 'Very Low'}
        },
        {
            x = 299,
            y = 186,
            i = 10,
            min = 1,
            max = 7,
            table = {'Off', 'High', 'Med. High', 'Medium', 'Med. Low', 'Low', 'Very Low'}
        }
    }
}
