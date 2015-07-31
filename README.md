vagrant-oracle-xe-11g
-----------------

仮想マシンを作成し、Oracle XE 11gをインストールします。

- CentOS-6-x64 Virtualbox VM を作成
- Oracle　XE 11g をインストール
- Oracleの文字コードをSJISに変更

必須インストール
-----------------

- VirtualBox

  https://www.virtualbox.org/wiki/Downloads

  * 最新バージョンでVagrantの動作に失敗する場合、4.3系列を利用してください。

    https://www.virtualbox.org/wiki/Download_Old_Builds_4_3

- Vagrant

  http://www.vagrantup.com/downloads.html

- Oracle XE 11g

  http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html

利用方法
------------
このリポジトリをクローンする。

OracleのサイトよりダウンロードしたRPMファイルを、クローンしたリポジトリのoracleフォルダに配置する。

リポジトリのフォルダでコマンドを実行する。

* VMを起動する。初回起動時は仮想マシンの作成とプロビジョニングが行われるため時間がかかる（15～30分ぐらい）。
  ```
  $ vagrant up
  ```

* VMを停止する。
  ```
  $ vagrant halt
  ```

* VMを破棄する。仮想マシン内に保存されていたデータはすべて消えるため注意。
  ```
  $ vagrant destroy
  ```

* VMにSSHで接続する。
 * コマンドライン版のSSHがインストールされていない場合は失敗する。Cygwinを利用するとログイン可。
  ```
  $ vagrant ssh
  ```

仮想マシンのアカウントとパスワード
------------
- CentOS
  * vagrant / vagrant
  * root / vagrant

- Oracle
  * SYS/MANAGER
  * SYSTEM/MANAGER
    ```shell
    su - oracle
    sqlplus / as sysdba
    ```
* `Bonjour64.msi`をインストールすれば、`oracle.local`のホスト名で、仮想マシンにTCP/IP接続が可能になる。

参考
------------
https://github.com/ismaild/vagrant-centos-oracle

http://blog.codiez.co.za//2013/11/install-oracle-centos-64-vagrant-ansible/

http://www.ajisaba.net/db/ora_linux_sjis.html
