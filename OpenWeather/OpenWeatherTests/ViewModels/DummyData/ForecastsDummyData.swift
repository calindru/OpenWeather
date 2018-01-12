//
//  ForecastsDummyData.swift
//  OpenWeatherTests
//
//  Created by Calin Drule on 11/01/2018.
//  Copyright © 2018 Calin Drule. All rights reserved.
//

import Foundation

struct ForecastsDummyData {
    static let dummyJSON = """
{"cod":"200","message":0.029,"cnt":40}
"""
    
    static let onlineSingleForecastData = """
{"cod":"200","message":0.029,"cnt":40,"list":[{"dt":1515704400,"main":{"temp":6.19,"temp_min":5.15,"temp_max":6.19,"pressure":1029.62,"sea_level":1037.46,"grnd_level":1029.62,"humidity":97,"temp_kf":1.04},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":88},"wind":{"speed":2.37,"deg":339.003},"rain":{"3h":0.135},"sys":{"pod":"n"},"dt_txt":"2018-01-11 21:00:00"}]}
"""
    
    static let onlineForecastsData = """
{"cod":"200","message":0.029,"cnt":40,"list":[{"dt":1515704400,"main":{"temp":6.19,"temp_min":5.15,"temp_max":6.19,"pressure":1029.62,"sea_level":1037.46,"grnd_level":1029.62,"humidity":97,"temp_kf":1.04},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":88},"wind":{"speed":2.37,"deg":339.003},"rain":{"3h":0.135},"sys":{"pod":"n"},"dt_txt":"2018-01-11 21:00:00"},{"dt":1515715200,"main":{"temp":5.65,"temp_min":4.88,"temp_max":5.65,"pressure":1030.4,"sea_level":1038.33,"grnd_level":1030.4,"humidity":100,"temp_kf":0.78},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":92},"wind":{"speed":1.47,"deg":349.001},"rain":{"3h":0.11},"sys":{"pod":"n"},"dt_txt":"2018-01-12 00:00:00"},{"dt":1515726000,"main":{"temp":5.09,"temp_min":4.57,"temp_max":5.09,"pressure":1030.97,"sea_level":1038.9,"grnd_level":1030.97,"humidity":99,"temp_kf":0.52},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":92},"wind":{"speed":1.21,"deg":347.502},"rain":{"3h":0.145},"sys":{"pod":"n"},"dt_txt":"2018-01-12 03:00:00"},{"dt":1515736800,"main":{"temp":4.39,"temp_min":4.13,"temp_max":4.39,"pressure":1031.74,"sea_level":1039.62,"grnd_level":1031.74,"humidity":96,"temp_kf":0.26},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":88},"wind":{"speed":1.2,"deg":26.5018},"rain":{"3h":0.115},"sys":{"pod":"n"},"dt_txt":"2018-01-12 06:00:00"},{"dt":1515747600,"main":{"temp":3.9,"temp_min":3.9,"temp_max":3.9,"pressure":1032,"sea_level":1039.84,"grnd_level":1032,"humidity":98,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":88},"wind":{"speed":1.22,"deg":88.5013},"rain":{"3h":0.1},"sys":{"pod":"d"},"dt_txt":"2018-01-12 09:00:00"},{"dt":1515758400,"main":{"temp":5.13,"temp_min":5.13,"temp_max":5.13,"pressure":1031.67,"sea_level":1039.44,"grnd_level":1031.67,"humidity":99,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":64},"wind":{"speed":1.77,"deg":159.001},"rain":{"3h":0.06},"sys":{"pod":"d"},"dt_txt":"2018-01-12 12:00:00"},{"dt":1515769200,"main":{"temp":5.27,"temp_min":5.27,"temp_max":5.27,"pressure":1030.72,"sea_level":1038.59,"grnd_level":1030.72,"humidity":92,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":88},"wind":{"speed":1.55,"deg":174.506},"rain":{"3h":0.05},"sys":{"pod":"d"},"dt_txt":"2018-01-12 15:00:00"},{"dt":1515780000,"main":{"temp":4.45,"temp_min":4.45,"temp_max":4.45,"pressure":1030.47,"sea_level":1038.42,"grnd_level":1030.47,"humidity":94,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":88},"wind":{"speed":1.91,"deg":135.007},"rain":{"3h":0.09},"sys":{"pod":"n"},"dt_txt":"2018-01-12 18:00:00"},{"dt":1515790800,"main":{"temp":4.59,"temp_min":4.59,"temp_max":4.59,"pressure":1030.09,"sea_level":1037.93,"grnd_level":1030.09,"humidity":97,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":88},"wind":{"speed":2.52,"deg":136.006},"rain":{"3h":0.15},"sys":{"pod":"n"},"dt_txt":"2018-01-12 21:00:00"},{"dt":1515801600,"main":{"temp":4.62,"temp_min":4.62,"temp_max":4.62,"pressure":1029.46,"sea_level":1037.35,"grnd_level":1029.46,"humidity":99,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":88},"wind":{"speed":3.17,"deg":151.506},"rain":{"3h":0.13},"sys":{"pod":"n"},"dt_txt":"2018-01-13 00:00:00"},{"dt":1515812400,"main":{"temp":4.19,"temp_min":4.19,"temp_max":4.19,"pressure":1028.41,"sea_level":1036.3,"grnd_level":1028.41,"humidity":96,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":80},"wind":{"speed":3.46,"deg":148.5},"rain":{"3h":0.05},"sys":{"pod":"n"},"dt_txt":"2018-01-13 03:00:00"},{"dt":1515823200,"main":{"temp":3.83,"temp_min":3.83,"temp_max":3.83,"pressure":1028.12,"sea_level":1035.93,"grnd_level":1028.12,"humidity":96,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":88},"wind":{"speed":3.57,"deg":148.501},"rain":{"3h":0.06},"sys":{"pod":"n"},"dt_txt":"2018-01-13 06:00:00"},{"dt":1515834000,"main":{"temp":3.73,"temp_min":3.73,"temp_max":3.73,"pressure":1027.76,"sea_level":1035.64,"grnd_level":1027.76,"humidity":95,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":88},"wind":{"speed":4.32,"deg":136.002},"rain":{"3h":0.09},"sys":{"pod":"d"},"dt_txt":"2018-01-13 09:00:00"},{"dt":1515844800,"main":{"temp":4.27,"temp_min":4.27,"temp_max":4.27,"pressure":1027.33,"sea_level":1035.17,"grnd_level":1027.33,"humidity":93,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":80},"wind":{"speed":4.52,"deg":141},"rain":{"3h":0.06},"sys":{"pod":"d"},"dt_txt":"2018-01-13 12:00:00"},{"dt":1515855600,"main":{"temp":4.61,"temp_min":4.61,"temp_max":4.61,"pressure":1026.37,"sea_level":1034.18,"grnd_level":1026.37,"humidity":87,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":88},"wind":{"speed":4.06,"deg":136},"rain":{"3h":0.01},"sys":{"pod":"d"},"dt_txt":"2018-01-13 15:00:00"},{"dt":1515866400,"main":{"temp":3.42,"temp_min":3.42,"temp_max":3.42,"pressure":1026.28,"sea_level":1034.09,"grnd_level":1026.28,"humidity":84,"temp_kf":0},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}],"clouds":{"all":48},"wind":{"speed":3.33,"deg":127.505},"rain":{},"sys":{"pod":"n"},"dt_txt":"2018-01-13 18:00:00"},{"dt":1515877200,"main":{"temp":2.1,"temp_min":2.1,"temp_max":2.1,"pressure":1026.23,"sea_level":1034.11,"grnd_level":1026.23,"humidity":97,"temp_kf":0},"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}],"clouds":{"all":56},"wind":{"speed":3.13,"deg":120.5},"rain":{},"sys":{"pod":"n"},"dt_txt":"2018-01-13 21:00:00"},{"dt":1515888000,"main":{"temp":1.6,"temp_min":1.6,"temp_max":1.6,"pressure":1026.16,"sea_level":1034.07,"grnd_level":1026.16,"humidity":100,"temp_kf":0},"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}],"clouds":{"all":24},"wind":{"speed":2.95,"deg":123.502},"rain":{},"sys":{"pod":"n"},"dt_txt":"2018-01-14 00:00:00"},{"dt":1515898800,"main":{"temp":0.82,"temp_min":0.82,"temp_max":0.82,"pressure":1025.95,"sea_level":1033.87,"grnd_level":1025.95,"humidity":99,"temp_kf":0},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}],"clouds":{"all":36},"wind":{"speed":2.41,"deg":115.501},"rain":{},"sys":{"pod":"n"},"dt_txt":"2018-01-14 03:00:00"},{"dt":1515909600,"main":{"temp":0.57,"temp_min":0.57,"temp_max":0.57,"pressure":1025.78,"sea_level":1033.78,"grnd_level":1025.78,"humidity":100,"temp_kf":0},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}],"clouds":{"all":44},"wind":{"speed":2.41,"deg":108.501},"rain":{},"sys":{"pod":"n"},"dt_txt":"2018-01-14 06:00:00"},{"dt":1515920400,"main":{"temp":-0.08,"temp_min":-0.08,"temp_max":-0.08,"pressure":1026.65,"sea_level":1034.62,"grnd_level":1026.65,"humidity":94,"temp_kf":0},"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],"clouds":{"all":56},"wind":{"speed":1.26,"deg":95.5006},"rain":{},"sys":{"pod":"d"},"dt_txt":"2018-01-14 09:00:00"},{"dt":1515931200,"main":{"temp":3.31,"temp_min":3.31,"temp_max":3.31,"pressure":1026.59,"sea_level":1034.43,"grnd_level":1026.59,"humidity":93,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":48},"wind":{"speed":1.82,"deg":110.001},"rain":{"3h":0.01},"sys":{"pod":"d"},"dt_txt":"2018-01-14 12:00:00"},{"dt":1515942000,"main":{"temp":3.47,"temp_min":3.47,"temp_max":3.47,"pressure":1025.99,"sea_level":1033.93,"grnd_level":1025.99,"humidity":88,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":48},"wind":{"speed":1.78,"deg":124.501},"rain":{"3h":0.0125},"sys":{"pod":"d"},"dt_txt":"2018-01-14 15:00:00"},{"dt":1515952800,"main":{"temp":2.43,"temp_min":2.43,"temp_max":2.43,"pressure":1026.05,"sea_level":1033.94,"grnd_level":1026.05,"humidity":88,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":80},"wind":{"speed":1.32,"deg":159.5},"rain":{"3h":0.0375},"sys":{"pod":"n"},"dt_txt":"2018-01-14 18:00:00"},{"dt":1515963600,"main":{"temp":2.44,"temp_min":2.44,"temp_max":2.44,"pressure":1025.32,"sea_level":1033.19,"grnd_level":1025.32,"humidity":88,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":88},"wind":{"speed":2.56,"deg":197.508},"rain":{"3h":0.075},"sys":{"pod":"n"},"dt_txt":"2018-01-14 21:00:00"},{"dt":1515974400,"main":{"temp":2.54,"temp_min":2.54,"temp_max":2.54,"pressure":1023.77,"sea_level":1031.62,"grnd_level":1023.77,"humidity":89,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":8},"wind":{"speed":3.2,"deg":213.002},"rain":{"3h":0.025},"sys":{"pod":"n"},"dt_txt":"2018-01-15 00:00:00"},{"dt":1515985200,"main":{"temp":2.03,"temp_min":2.03,"temp_max":2.03,"pressure":1021.5,"sea_level":1029.36,"grnd_level":1021.5,"humidity":99,"temp_kf":0},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}],"clouds":{"all":44},"wind":{"speed":3.86,"deg":216},"rain":{},"sys":{"pod":"n"},"dt_txt":"2018-01-15 03:00:00"},{"dt":1515996000,"main":{"temp":3.53,"temp_min":3.53,"temp_max":3.53,"pressure":1018.57,"sea_level":1026.33,"grnd_level":1018.57,"humidity":99,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"clouds":{"all":92},"wind":{"speed":4.9,"deg":208.503},"rain":{},"sys":{"pod":"n"},"dt_txt":"2018-01-15 06:00:00"},{"dt":1516006800,"main":{"temp":6.17,"temp_min":6.17,"temp_max":6.17,"pressure":1015.63,"sea_level":1023.37,"grnd_level":1015.63,"humidity":96,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":92},"wind":{"speed":6.51,"deg":206.501},"rain":{"3h":0.5875},"sys":{"pod":"d"},"dt_txt":"2018-01-15 09:00:00"},{"dt":1516017600,"main":{"temp":7.62,"temp_min":7.62,"temp_max":7.62,"pressure":1011.37,"sea_level":1019,"grnd_level":1011.37,"humidity":95,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":92},"wind":{"speed":8.72,"deg":214.001},"rain":{"3h":1.725},"sys":{"pod":"d"},"dt_txt":"2018-01-15 12:00:00"},{"dt":1516028400,"main":{"temp":8.97,"temp_min":8.97,"temp_max":8.97,"pressure":1006.32,"sea_level":1014.01,"grnd_level":1006.32,"humidity":95,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":92},"wind":{"speed":7.67,"deg":229.502},"rain":{"3h":3},"sys":{"pod":"d"},"dt_txt":"2018-01-15 15:00:00"},{"dt":1516039200,"main":{"temp":9.41,"temp_min":9.41,"temp_max":9.41,"pressure":1004.09,"sea_level":1011.6,"grnd_level":1004.09,"humidity":97,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":76},"wind":{"speed":6.71,"deg":250.001},"rain":{"3h":0.875},"sys":{"pod":"n"},"dt_txt":"2018-01-15 18:00:00"},{"dt":1516050000,"main":{"temp":8.39,"temp_min":8.39,"temp_max":8.39,"pressure":1002.04,"sea_level":1009.55,"grnd_level":1002.04,"humidity":98,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":88},"wind":{"speed":7.06,"deg":249.001},"rain":{"3h":0.3625},"sys":{"pod":"n"},"dt_txt":"2018-01-15 21:00:00"},{"dt":1516060800,"main":{"temp":8.07,"temp_min":8.07,"temp_max":8.07,"pressure":999.85,"sea_level":1007.44,"grnd_level":999.85,"humidity":97,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":88},"wind":{"speed":7.56,"deg":252},"rain":{"3h":0.975},"sys":{"pod":"n"},"dt_txt":"2018-01-16 00:00:00"},{"dt":1516071600,"main":{"temp":7.21,"temp_min":7.21,"temp_max":7.21,"pressure":995.43,"sea_level":1003.07,"grnd_level":995.43,"humidity":100,"temp_kf":0},"weather":[{"id":501,"main":"Rain","description":"moderate rain","icon":"10n"}],"clouds":{"all":92},"wind":{"speed":6.56,"deg":238.5},"rain":{"3h":3.4125},"sys":{"pod":"n"},"dt_txt":"2018-01-16 03:00:00"},{"dt":1516082400,"main":{"temp":6.97,"temp_min":6.97,"temp_max":6.97,"pressure":995.07,"sea_level":1002.57,"grnd_level":995.07,"humidity":95,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":64},"wind":{"speed":9.71,"deg":275.502},"rain":{"3h":2.575},"sys":{"pod":"n"},"dt_txt":"2018-01-16 06:00:00"},{"dt":1516093200,"main":{"temp":5.13,"temp_min":5.13,"temp_max":5.13,"pressure":998.1,"sea_level":1005.67,"grnd_level":998.1,"humidity":92,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":56},"wind":{"speed":8.76,"deg":273.506},"rain":{"3h":0.012499999999999},"sys":{"pod":"d"},"dt_txt":"2018-01-16 09:00:00"},{"dt":1516104000,"main":{"temp":5.41,"temp_min":5.41,"temp_max":5.41,"pressure":998.75,"sea_level":1006.3,"grnd_level":998.75,"humidity":94,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":0},"wind":{"speed":7.86,"deg":266},"rain":{"3h":0.025},"sys":{"pod":"d"},"dt_txt":"2018-01-16 12:00:00"},{"dt":1516114800,"main":{"temp":5.57,"temp_min":5.57,"temp_max":5.57,"pressure":996.81,"sea_level":1004.36,"grnd_level":996.81,"humidity":95,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":68},"wind":{"speed":6.81,"deg":251},"rain":{"3h":0.0375},"sys":{"pod":"d"},"dt_txt":"2018-01-16 15:00:00"},{"dt":1516125600,"main":{"temp":4.98,"temp_min":4.98,"temp_max":4.98,"pressure":995.18,"sea_level":1002.76,"grnd_level":995.18,"humidity":93,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":56},"wind":{"speed":7,"deg":263},"rain":{"3h":0.1125},"sys":{"pod":"n"},"dt_txt":"2018-01-16 18:00:00"}],"city":{"id":2643743,"name":"London","coord":{"lat":51.5085,"lon":-0.1258},"country":"GB","population":1000000}}
"""
    
    static let offlineForecastsData = "11.01.2018, 23:00, 6.26\n12.01.2018, 02:00, 5.71\n12.01.2018, 05:00, 5.12\n12.01.2018, 08:00, 4.41\n12.01.2018, 11:00, 3.9\n12.01.2018, 14:00, 5.13\n12.01.2018, 17:00, 5.27\n12.01.2018, 20:00, 4.45\n12.01.2018, 23:00, 4.59\n13.01.2018, 02:00, 4.62\n13.01.2018, 05:00, 4.19\n13.01.2018, 08:00, 3.83\n13.01.2018, 11:00, 3.73\n13.01.2018, 14:00, 4.27\n13.01.2018, 17:00, 4.61\n13.01.2018, 20:00, 3.42\n13.01.2018, 23:00, 2.1\n14.01.2018, 02:00, 1.6\n14.01.2018, 05:00, 0.82\n14.01.2018, 08:00, 0.57\n14.01.2018, 11:00, -0.08\n14.01.2018, 14:00, 3.31\n14.01.2018, 17:00, 3.47\n14.01.2018, 20:00, 2.43\n14.01.2018, 23:00, 2.44\n15.01.2018, 02:00, 2.54\n15.01.2018, 05:00, 2.03\n15.01.2018, 08:00, 3.53\n15.01.2018, 11:00, 6.17\n15.01.2018, 14:00, 7.62\n15.01.2018, 17:00, 8.97\n15.01.2018, 20:00, 9.41\n15.01.2018, 23:00, 8.39\n16.01.2018, 02:00, 8.07\n16.01.2018, 05:00, 7.21\n16.01.2018, 08:00, 6.97\n16.01.2018, 11:00, 5.13\n16.01.2018, 14:00, 5.41\n16.01.2018, 17:00, 5.57\n16.01.2018, 20:00, 4.98\n"
}