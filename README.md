# WebScrapingToGlobal
lxmlを使用しWebスクレイピングした結果をグローバルに格納する

[Embedded Python で Excel のデータを IRIS グローバルに格納する方法](https://jp.community.intersystems.com/node/516426) では pandas.DataFrame のデータを InterSystems IRIS グローバルに保存する方法をご紹介しました。  
こちらのサンプルでは、「[lxmlを使用しWebスクレイピングした表の結果をグローバルに格納する](https://jp.community.intersystems.com/node/522816)」方法をご紹介します。

## サンプルコードについて
この Git のサンプルコードは、[InterSystems 開発者コミュニティ](https://jp.community.intersystems.com/) に公開している以下記事のサンプルコードです。  

[lxmlを使用しWebスクレイピングした表の結果をグローバルに格納する](https://jp.community.intersystems.com/node/522816)

## 含まれるファイル
* User.PythonTest2.xml　　　// スタジオインポート用クラス定義
* UserPythonTest2.cls 　　　// VSCodeインポート用クラス定義
    
## セットアップ方法
動作バージョン InterSystems IRIS 2021.2以降
  
スタジオをご利用の方は、User.TestStoredProc2.xml を対象のネームスペースにインポート・コンパイルしてください。  
VSCodeをご利用の方は、IRISに接続後、対象のネームスペースに UserPythonTest2.cls を保存・コンパイルしてご利用ください。  

## 事前準備

irispip コマンドで必要なライブラリをインストールします。  
今回は、pandas、lxml の2つのライブラリをインストールします。  
※以下は Windows 上の IRIS でのインストール方法になります。  
　UNIX ベースのシステムでは、pip3 コマンドを使用してインストールします。詳細は [ドキュメント](https://docs.intersystems.com/iris20221/csp/docbookj/DocBook.UI.Page.cls?KEY=AFL_epython#AFL_epython_pylibrary_install) をご覧ください。
~~~
>cd C:\InterSystems\IRIS\bin
C:\InterSystems\IRIS\bin>irispip install --target C:\InterSystems\IRIS\mgr\python pandas
C:\InterSystems\IRIS\bin>irispip install --target C:\InterSystems\IRIS\mgr\python lxml
~~~

## 実行方法
ターミナルで確認する場合は、以下のように実行します。
~~~
USER>kill ^ISJ2
 
USER>do ##class(User.PythonTest2).PythonWebScraping("https://finance.yahoo.co.jp/quote/6178.T/history")
 
USER>zwrite ^ISJ2                                                                   
^ISJ2=20
^ISJ2(1)=$lb("2022年7月25日","963.0","966.3","962.1","965.2","5200900","965.2")
^ISJ2(2)=$lb("2022年7月22日","965.1","967.1","959.0","965.0","8665700","965.0")
^ISJ2(3)=$lb("2022年7月21日","973.4","977.5","971.5","972.1","11539000","972.1")
^ISJ2(4)=$lb("2022年7月20日","971.2","974.8","968.2","974.8","8864700","974.8")
^ISJ2(5)=$lb("2022年7月19日","966.8","970.9","962.4","966.6","5714100","966.6")
^ISJ2(6)=$lb("2022年7月15日","970.0","970.6","956.6","962.7","9064300","962.7")
^ISJ2(7)=$lb("2022年7月14日","975.0","976.9","966.5","968.7","10921300","968.7")
^ISJ2(8)=$lb("2022年7月13日","984.0","986.5","981.8","982.3","6361500","982.3")
^ISJ2(9)=$lb("2022年7月12日","981.0","985.8","978.8","981.7","8801600","981.7")
^ISJ2(10)=$lb("2022年7月11日","979.0","987.0","975.0","981.5","10416500","981.5")
^ISJ2(11)=$lb("2022年7月8日","971.7","977.6","968.3","973.6","10220600","973.6")
^ISJ2(12)=$lb("2022年7月7日","979.0","984.0","965.1","969.8","10874300","969.8")
^ISJ2(13)=$lb("2022年7月6日","975.0","976.1","964.1","970.8","12283000","970.8")
^ISJ2(14)=$lb("2022年7月5日","985.0","989.6","980.2","988.4","9458900","988.4")
^ISJ2(15)=$lb("2022年7月4日","975.0","983.1","972.3","983.1","9618800","983.1")
^ISJ2(16)=$lb("2022年7月1日","974.0","986.7","969.2","971.0","15510400","971.0")
^ISJ2(17)=$lb("2022年6月30日","957.9","971.0","952.1","969.1","11908700","969.1")
^ISJ2(18)=$lb("2022年6月29日","965.5","972.8","961.3","962.9","28123200","962.9")
^ISJ2(19)=$lb("2022年6月28日","951.5","967.6","948.3","967.6","12559200","967.6")
^ISJ2(20)=$lb("2022年6月27日","960.0","960.6","946.8","952.3","15059600","952.3")
 
USER>
~~~

## おまけ

以下のようなテーブルを表示する簡単なCSP/HTMLファイルを作成した場合も同様に取得できます。
~~~
<html>
<head>
<meta charset="utf-8">
</head>
<body>
<table border=1>
  <tr><td>佐藤</td> <td>19</td> <td>A型</td></tr>
  <tr><td>加藤</td> <td>24</td> <td>O型</td></tr>
  <tr><td>伊藤</td> <td>20</td> <td>B型</td></tr>
</table></body>
</html>
~~~

同じように実行します。
~~~
SER>kill ^ISJ2

USER>do ##class(User.PythonTest2).PythonWebScraping("http://localhost/csp/user/test.csp")

USER>zwrite ^ISJ2
^ISJ2=3
^ISJ2(1)=$lb("佐藤","19","A型")
^ISJ2(2)=$lb("加藤","24","O型")
^ISJ2(3)=$lb("伊藤","20","B型")

USER>

~~~

