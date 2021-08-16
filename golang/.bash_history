#1618021644
pwd
#1618021646
ll
#1618021650
ls -l
#1618021660
cd /home/tenyee/
#1618021660
ls
#1618021661
ll
#1618021676
pwd
#1618021688
mkdir
#1618021770
mkdir -p golang/study
#1618021772
ls
#1618021786
cd golang/study/
#1618021787
pwd
#1618021847
exit
#1618021935
ll
#1618021942
cd golang/study/
#1618021943
ls
#1618021955
go
#1618022689
cd /usr/local/
#1618022690
ls
#1618022692
ll
#1618022702
su root
#1618022921
cd go/bin/
#1618022926
cd /home/tenyee/
#1618022927
ls
#1618022931
ll -a
#1618022963
export PATH=$PATH:/usr/local/go/bin
#1618022964
go
#1618022990
vim .bash_profile 
#1618023018
vim .bash_profile 
#1618023121
echo $PATH
#1618023129
go
#1618023136
pwd
#1618023144
cd golang/study/
#1618023145
ls
#1618023158
go fmt dup1.go 
#1618023163
go run dup1.go 
#1618023179
go run dup1.go 
#1618023226
go run dup1.go 
#1618023740
go fmt fetch.go 
#1618023754
go fmt fetch.go 
#1618023801
go fmt fetch.go 
#1618023809
gofmt fetch.go 
#1618023827
gofmt fetch.go 
#1618023967
go fmt fetch.go 
#1618023971
gofmt fetch.go 
#1618023986
clear
#1618023996
go run fetch.go www.baidu.com
#1618024014
go run fetch.go www.baidu.com
#1618024034
go run fetch.go www.baidu.com
#1618024079
go run fetch.go www.baidu.com http://c.biancheng.net/view/4441.html
#1618026114
ls
#1618026116
cd golang/study/
#1618026117
ls
#1618026124
go build fetchAll.go 
#1618026143
go build fetchAll.go 
#1618026152
go build fetchAll.go 
#1618026157
ls
#1618026194
./fetchall https://golang.org http://gopl.io https://godoc.org
#1618026206
./fetchAll https://golang.org http://gopl.io https://godoc.org
#1618026265
./fetchAll http://gopl.io https://www.baidu.com
#1618023064
su root
#1618036014
cd golang/study/
#1618036015
ls
#1618036016
ll
#1618036594
go run boilling.go 
#1618036613
go run boilling.go 
#1618036679
go run boilling.go 
#1618036698
go run boilling.go 
#1618036731
go run boilling.go 
#1618036950
go run boilling.go 
#1618036965
go run boilling.go 
#1618037001
go run boilling.go 
#1618037028
go run boilling.go 
#1618037052
go run boilling.go 
#1618037461
go run boilling.go 
#1618037477
go run boilling.go 
#1618037507
go run boilling.go 
#1618037524
go run boilling.go 
#1618037536
go run boilling.go 
#1618038558
go run boilling.go 
#1618038573
go run boilling.go 
#1618039220
go run boilling.go 
#1618039244
go run boilling.go 
#1618039283
go run boilling.go 
#1618040687
echo $GOPATH
#1618040904
ll
#1618040934
cd golang/
#1618040935
ls
#1618040943
cd study/
#1618040944
ls
#1618041101
ls
#1618041108
ll book.stadygolang/ch2/tempconv/
#1618041381
ll
#1618041389
go run temp.go 
#1618041583
ll book.stadygolang/ch2/tempconv/
#1618041601
cd book.stadygolang/ch2/tempconv/
#1618041602
ls
#1618041608
cat conv.go 
#1618041614
cat tempconv.go 
#1618041622
clear
#1618041703
pwd
#1618041706
cd -
#1618041707
pwd
#1618041708
ll
#1618041729
GOPATH=GOPATH:$(pwd)
#1618041737
echo $GOPATH
#1618041760
GOPATH=$(pwd)
#1618041762
echo $GOPATH
#1618041769
ls
#1618041779
go run temp.go 
#1618041800
go help modules
#1618042212
ll
#1618042235
cp -p book.stadygolang/ch2/* ./
#1618042247
cp -P book.stadygolang/ch2/* ./
#1618042254
cp -R book.stadygolang/ch2/* ./
#1618042255
ll
#1618042263
ll tempconv/
#1618042275
rm -rf book.stadygolang
#1618042276
ls
#1618042277
ll
#1618042322
ll
#1618042324
ll
#1618042345
go run temp.go 
#1618042380
GOROOT=$GOROOT:$(pwd)
#1618042382
go run temp.go 
#1618042403
echo $GOROOT
#1618042424
go env
#1618042525
go run temp.go 
#1618042685
go mod init
#1618042697
go mod init tempconv
#1618042711
ll
#1618042716
ll tempconv/
#1618042752
go run temp.go 
#1618042805
rm go.mod
#1618042812
go mod init
#1618042825
go help mod init
#1618042896
ll
#1618043066
go env -w GO111MODULE=off
#1618043071
go run temp.go 
#1618043158
go env -w GO111MODULE=auto
#1618043162
go run temp.go 
#1618043286
cd tempconv/
#1618043296
go mod init tempconv
#1618043300
go mod tidy
#1618043301
ll
#1618043319
cd ..
#1618043324
rm go.mod
#1618043327
ls
#1618043327
ll
#1618043335
go run temp.go 
#1618043386
go mod init .
#1618043446
export GO111MODULE=on
#1618043449
go run temp.go 
#1618043469
go env | grep GO111
#1618043591
go mod init tempconv
#1618043598
go mod tidy
#1618043600
ll
#1618043620
ll
#1618043625
cat go.mod
#1618043652
go run temp.go 
#1618043703
mv tempconv tempconv2
#1618043705
ll
#1618043723
ll
#1618043761
go run temp.go 
#1618043789
go run temp.go 
#1618043857
go build temp.go 
#1618044278
ll
#1618044302
go run temp.go 
#1618044313
rm go.mod
#1618044316
go run temp.go 
#1618044329
ll /usr/local/go/src/
#1618044365
cd /usr/local/go/src/
#1618044366
ls
#1618044375
ll | grep cus
#1618044385
cd fmt/
#1618044386
ll
#1618044399
cd ..
#1618044412
mkdir custom
#1618044420
sudo mkdir custom
#1618044457
vim /etc/sudoers
#1618044467
su root
#1618044546
sudo mkdir custom
#1618044553
ls
#1618044674
cp -p /home/tenyee/golang/study/tempconv2 ./tempconv
#1618044681
cp -p /home/tenyee/golang/study/tempconv2/* ./tempconv
#1618044689
cp -P /home/tenyee/golang/study/tempconv2/* ./tempconv
#1618044697
cp -r /home/tenyee/golang/study/tempconv2/* ./tempconv
#1618044703
cp -R /home/tenyee/golang/study/tempconv2/* ./tempconv
#1618044711
mkdir tempconv
#1618044738
sudo mkdir -p custom/tempconv
#1618044749
cp -R /home/tenyee/golang/study/tempconv2/* ./custom/tempconv
#1618044759
sudo cp -R /home/tenyee/golang/study/tempconv2/* ./custom/tempconv
#1618044777
sudo cp -R /home/tenyee/golang/study/tempconv2/* ./custom/tempconv
#1618044783
cd -
#1618044786
cd -
#1618044797
cd /home/tenyee/golang/study/
#1618044798
ll
#1618044805
go run temp.go 
#1618044822
go run temp.go 
#1618063114
cd golang/study/
#1618063115
ls
#1618063120
go run map.go 
#1618063155
go run map.go 
#1618063184
go run map.go 
#1618063203
go run map.go 
#1618549989
ls
#1618549994
cd golang/study/
#1618549996
ls
#1618550003
go run man.go
#1618550008
ll
#1618550019
go run map.go 
#1618550057
go run map.go 
#1618551049
go run map.go 
#1618551065
go run map.go 
#1619227902
cd golang/
#1619227903
ll
#1619227905
cd study/
#1619227906
ll
#1619227911
go run panic.go 
#1619227923
go run panic.go 
#1619227949
go run panic.go 
#1619232428
cd golang/study/
#1619232429
ll
#1619232436
go run panic.go 
#1619232459
go run panic.go 
#1619232480
go run panic.go 
#1619232502
go run panic.go 
#1619232519
go run panic.go 
#1619232955
ll
#1619232993
go get github.com/pkg/errors
#1619233719
go list std
#1619233731
go list std | wc -l
#1619234438
go 
#1619234451
go version
#1619234494
ll
#1619234503
$GOPATH
#1619234508
echo $GOPATH
#1619234531
go
#1619234562
go gopath
#1619234569
go help gopath
#1619234609
go env | grep GOPATH
#1619234620
PWD
#1619234621
pwd
#1619234633
mkdir mod_demo
#1619234635
cd mod_demo/
#1619234635
ll
#1619234741
touch main.go
#1619234787
go mod test-demo
#1619234806
go mod init test-demo
#1619234814
ll
#1619234817
cat go.mod 
#1619234838
go run main.go 
#1619234863
go fmt main.go 
#1619234922
go fmt main.go 
#1619234937
go fmt main.go 
#1619234995
go fmt main.go 
#1619235136
go fmt main.go 
#1619235142
go run main.go 
#1619235158
go get github.com/astaxie/beego
#1620346288
uname -a
#1620346316
bt
#1620346323
su root
#1620346345
su root
#1620346901
su root
#1621776826
uname -a
#1621776885
curl -sSL https://get.daocloud.io/docker | sh
#1621777097
docker run ubuntu:15.10 /bin/echo "hello world"
#1621777122
docker run --help
#1621777385
yum list installed | grep docker
#1621777395
docker -v
#1621948787
uname -a
#1621948840
su root
#1621950625
su root
#1622029590
su root
#1622776170
docker info
#1622776174
docker images
#1622776185
sudo docker images
#1622776196
su root
#1622776496
ru root
#1622776500
su root
#1622777588
docker ps 
#1622777594
su root
#1622778052
su root
#1622778317
su root
#1622778831
exit
#1623327077
echo $GOPATH
#1623327081
go
#1623327089
echo $GOPATH
#1623327090
env
#1623327096
env | grep GO
#1623327131
echo $GO_PATH
#1623327165
whereis go
#1623327183
cd /usr/local/go/
#1623327184
ll
#1623327191
cd test/
#1623327191
ll
#1623327195
cd ..
#1623327196
ll
#1623327203
cd src/
#1623327204
ls
#1623327213
cd -
#1623327293
go env
#1623327311
cd /home/tenyee/go
#1623327312
ll
#1623327318
ll pkg/
#1623327322
cd src/
#1623327324
ll
#1623327331
cd github.com/
#1623327333
ll
#1623327336
cd pkg/
#1623327338
ll
#1623327341
cd ../../..
#1623327342
ll
#1623327349
ll src/github.com/pkg/
#1623327355
ll
#1623327360
mkdir bin
#1623327362
ll
#1623327460
cd ..
#1623327460
ll
#1623327468
cd golang/
#1623327468
ll
#1623327471
cd study/
#1623327471
ll
#1623327480
cd ../../
#1623327481
ll
#1623327486
rm -rf golang
#1623327487
ll
#1623327488
ll
#1623328739
go env
#1623329131
cd /home/tenyee/go/
#1623329131
ls
#1623329143
cd src/
#1623329144
ll
#1623329147
cd github.com/
#1623329147
ll
#1623329152
rm -rf pkg
#1623329153
ll
#1623329159
mkdir tenyee
#1623329161
cd tenyee/
#1623329162
ll
#1623329173
pwd
#1623329334
mkdir study-go
#1623329337
cd study-go/
#1623329338
ll
#1623329340
pwd
#1623329398
cd ..
#1623329398
ll
#1623329402
rm study-go
#1623329405
rm -rf study-go
#1623329433
ll
#1623329598
ll
#1623329601
cd study-go/day01/helloworld/
#1623329601
ll
#1623329605
go run main.go 
#1623329629
go run main.go 
#1623329639
go build main.go 
#1623329641
ll
#1623329647
go
#1623329656
go help build
#1623329753
clear
#1623329756
ll
#1623330190
clear
#1623330191
ll
#1623330209
go build main.go -o hello
#1623330230
go build -o hello main.go 
#1623330231
ll
#1623330396
go install -o hello main.go 
#1623330407
go install  main.go 
#1623330421
go env
#1623330427
goenv | grep GOBIN
#1623330432
go env | grep GOBIN
#1623330440
go 
#1623330550
set GOBIN=${GOPATH}/bin
#1623330558
go env | grep GOBIN
#1623330567
echo ${GOBIN}
#1623331055
python
#1623331158
ll
#1623331166
cd ..
#1623331166
ll
#1623331189
mkdir 01var
#1623331192
cd 01var/
#1623331612
go build main.go 
#1623333275
cd go/src/github.com/tenyee/study-go/day01/01var/
#1623333276
ll
#1623333280
go run main.go 
#1623337101
cd go/src/github.com/tenyee/study-go/day01/01var/
#1623337101
ll
#1623337105
go run main.go 
#1623337132
go run main.go 
#1623337152
go run main.go 
#1623337232
go run main.go 
#1623337770
cd ../02string/
#1623337777
go run main.go 
#1623337798
go run main.go 
#1623338099
go run main.go 
#1623338368
go env | grep GOPATH
#1623338708
ll
#1623338715
go run main.go 
#1623338732
go run main.go 
#1623338992
go run main.go 
#1623339035
go run main.go 
#1623339050
go run main.go 
#1623339353
cd go/src/github.com/tenyee/study-go/day01/02string/
#1623339356
go run main.go 
#1623339393
go run main.go 
#1623339578
go run main.go 
#1623339598
go run main.go 
#1623339663
go run main.go 
#1623339693
go run main.go 
#1623340026
cd ../03for/
#1623340030
go run main.go 
#1623340046
go run main.go 
#1623340109
go run main.go 
#1623340218
go run main.go 
#1623340230
go run main.go 
#1623340246
go run main.go 
#1623340253
go run main.go 
#1623340318
go run main.go 
#1623340333
go run main.go 
#1623340411
go run main.go 
#1623340531
go run main.go 
#1623340552
go run main.go 
#1623340558
go run main.go 
#1623340798
go run main.go 
#1623367195
cd go/src/github.com/tenyee/study-go/day01/03for/
#1623367200
go run main.go 
#1623367240
go run main.go 
#1623367268
go run main.go 
#1623367410
go run main.go 
#1623367417
ll
#1623367421
cat main.go 
#1623367480
clear
#1623367483
go run main.go 
#1623368699
cd go/src/github.com/tenyee/study-go/day01/03for/
#1623368704
go run main.go 
#1623368742
go run main.go 
#1623368757
go run main.go 
#1623369044
go run main.go 
#1623369184
go run main.go 
#1623369822
go run main.go 
#1623369832
go run main.go 
#1623369875
go run main.go 
#1623369899
go run main.go 
#1623369952
go run main.go 
#1623369971
go run main.go 
#1623505531
su root
#1623554420
su root
#1623638073
su root
#1623642015
go env | grep GOPATH
#1623642037
ll
#1623642061
chown -R tenyee: ./go-with-mod
#1623642069
sudo chown -R tenyee: ./go-with-mod
#1623642077
ll
#1623642087
cd go-with-mod/
#1623642088
ll
#1623642091
cd github.com/tenyee/
#1623642091
ll
#1623642097
rm -rf day01/
#1623642098
ll
#1623642110
make greeting
#1623642115
mkdir greeting
#1623642119
cd greeting/
#1623642119
ll
#1623642187
go mod init github.com/tenyee/greeting
#1623642190
ll
#1623642193
cat go.mod 
#1623642266
vi greeting.go
#1623642475
cd ..
#1623642476
ll
#1623642481
mkdir hello
#1623642483
cd hello/
#1623642483
ll
#1623642484
cd ..
#1623642486
ll
#1623642489
tree
#1623642492
cd hello/
#1623642552
go mod init github.com/tenyee/hello
#1623642554
ll
#1623642557
cat go.mod 
#1623642595
vi hello.go
#1623642637
cat ../greeting/go.mod 
#1623642640
ll
#1623642690
vi hello.go 
#1623642702
cd ../greeting/
#1623642703
ll
#1623642708
cat greeting.go 
#1623642722
vi greeting.go 
#1623642741
clear
#1623642743
cat greeting.go 
#1623642747
cat go.mod 
#1623642754
cd ..
#1623642866
cd hello/
#1623642867
ll
#1623642931
go mod edit -replace github.com/tenyee/greeting=../greeting
#1623642936
cat go.mod 
#1623643007
go mod tidy
#1623643012
cat go.mod 
#1623643163
go run .
#1623643178
cat hello.go 
#1623643637
pwd
#1623643797
cd ../greeting/
#1623643802
cat go.mod 
#1623643861
cat greeting.go 
#1623644087
cd ..
#1623644087
ll
#1623644153
cd hello/
#1623644154
ll
#1623644156
cat go
#1623644159
cat go.mod 
#1623644267
cat hello.go 
#1623644504
cat go.mod 
#1623644959
go run hello.go 
#1623644965
[tenyee@VM-0-4-centos hello]$ go run hello.go 
#1623656442
cd go-with-mod/github.com/tenyee/greeting/
#1623656443
ll
#1623656457
vi greeting.go 
#1623656518
cd go-with-mod/github.com/tenyee/greeting/
#1623656519
ls
#1623656522
vi greeting.go 
#1623656696
go fmt greeting.go 
#1623656700
cat greeting.go 
#1623656817
cd ../hello/
#1623656819
vi hello.go 
#1623656931
go run .
#1623657070
vi ../greeting/greeting.go 
#1623657408
vi ../greeting/greeting.go 
#1623657494
vi hello.go 
#1623657521
go run .
#1623657524
go run .
#1623657529
go run .
#1623657534
go run .
#1623657540
go run .
#1623657758
go run .
#1623657762
vi ../greeting/greeting.go 
#1623657986
go fmt ../greeting/greeting.go 
#1623657990
vi ../greeting/greeting.go 
#1623658031
go fmt ../greeting/greeting.go 
#1623658102
vi hello.go 
#1623658166
go run .
#1623658180
go fmt ../greeting/greeting.go 
#1623658185
vi ../greeting/greeting.go 
#1623658221
go run .
#1623658351
cd ../greeting/
#1623658352
ll
#1623658361
vi greeting_test.go
#1623658874
go test
#1623658903
ll
#1623658908
go test -v
#1623658925
vi greeting_test.go 
#1623658946
go test
#1623658960
go test -v
#1623659019
vi greeting_test.go 
#1623659028
vi greeting.go 
#1623659077
go test
#1623659082
go test -v
#1623659151
vi greeting.go 
#1623659162
go test -v
#1623659233
go list -f '{{.Target}}'
#1623659400
go env | grep GOBIN
#1623659420
pwd
#1623659452
export PATH=$PATH:/home/tenyee/go-with-mod/bin
#1623659463
mkdir -p /home/tenyee/go-with-mod/bin
#1623659489
go env -w GOBIN=/home/tenyee/go-with-mod/bin
#1623659493
go env | grep GOBIN
#1623659507
cd ../hello/
#1623659508
ll
#1623659523
go install .
#1623659525
ll
#1623659531
ll /home/tenyee/go-with-mod/bin
#1623659540
hello
#1623659542
pwd
#1623659543
ll
#1623659564
hello
#1623663288
cd go-with-mod/github.com/tenyee/
#1623663288
ls
#1623663315
mkdir data
#1623663318
cd data/
#1623663318
ls
#1623663340
go mod init github.com/tenyee/data
#1623663343
ll
#1623663352
touch data.go
#1623663355
cd data
#1623663360
cd data.go
#1623663366
vi data.go 
#1623663560
go run .
#1623663573
vi data.go 
#1623663608
go run .
#1623663942
go run .
#1623663949
vi data.go 
#1623664010
go run .
#1623664205
vi data.go 
#1623664221
go run .
