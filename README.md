DIMACSの道路ネットワークをKMLファイルに変換するスクリプト
===================================================

下記のDIMACS Challengeで提供されている道路ネットワークをKMLファイルに変換する．
KMLファイルはGoogle Earth等で表示することができる（ただし動作が重い）．

9th DIMACS Implementation Challenge - Shortest Paths
http://www.dis.uniroma1.it/challenge9/download.shtml


準備
------

* 上記Webサイトから所望のエリアのCoordinatesグラフファイルとTravel timeグラフファイル(またはDistance graph)をダウンロードする

使い方
-------------

* generate_kml.rbを実行する．

* 第一引数は入力のCoordinatesグラフファイル
* 第二引数は入力のTravel timeグラフファイル(またはDistance graph)
* 第三引数は出力KMLファイル名
* 具体例
```
$ ruby generate_kml.rb USA-road-d.NY.co USA-road-t.NY.gr newyork.kml
```
