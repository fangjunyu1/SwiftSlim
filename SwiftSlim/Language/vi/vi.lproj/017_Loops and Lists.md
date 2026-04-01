# Vong lap va Danh sach

Trong bai hoc nay, chung ta se hoc vong lap `for` trong Swift va `ForEach` trong SwiftUI.

Ca hai deu giup chung ta doc cac phan tu trong mang theo dung thu tu. Trong qua trinh phat trien thuc te, chung ta thuong can lay tung phan du lieu trong mot nhom de xu ly hoac hien thi, va vong lap chinh la cong cu quan trong de hoan thanh viec nay.

Khi chung ta duyet web hoac su dung App, chung ta thuong thay rat nhieu danh sach hoac muc noi dung. Nhung noi dung nhu vay thuong duoc luu truoc trong `mang`, sau do duoc doc lan luot bang `vong lap`, cuoi cung moi hien thi len giao dien.

Vi du, danh sach ket qua tim kiem cua Google:

![Google](../../Resource/017_google.png)

Moi muc trong danh sach ket qua tim kiem thuong tuong ung voi mot muc du lieu, va duoc hien thi lan luot thong qua vong lap.

Vi vay, `mang` va `vong lap` thuong xuat hien cung nhau. `Mang` chiu trach nhiem luu mot nhom du lieu, con `vong lap` chiu trach nhiem lay cac du lieu nay ra theo thu tu va thuc hien cung mot thao tac.

Tiep theo, chung ta se bat dau tu vong lap `for` co ban nhat.

## Dem nguoc

Gia su chung ta muon mo phong mot chuc nang dem nguoc, lan luot in ra `“5, 4, 3, 2, 1”`.

Cach viet truc tiep nhat la:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Tuy cach nay co the mo phong chuc nang dem nguoc, nhung neu noi dung rat nhieu thi se tro nen lap lai, va sau nay cung khong tien de chinh sua.

Luc nay, chung ta co the dat du lieu vao mang truoc, sau do dung vong lap `for` de in ra lan luot:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Cach viet nay ngan gon hon va cung de mo rong hon. Ke ca khi co rat nhieu con so trong dem nguoc, chung ta cung khong can viet lap di lap lai `print` tung dong, chi can de vong lap tu dong xu ly tung phan tu trong mang.

Chung ta co the dat doan ma nay vao nut bam de thu:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Khi bam nut, vong lap `for` se lay tung so nguyen trong `countDown` theo dung thu tu cua mang, roi in chung ra console.

Tiep theo, chung ta se xem vong lap `for` hoat dong nhu the nao.

## Vong lap for

Vong lap `for` dung de xu ly mot nhom du lieu theo thu tu, doi tuong pho bien nhat la mang va pham vi.

Cach viet co ban:

```swift
for phanTu in mangHoacPhamVi {
    maCanThucHien
}
```

Vi du, doan ma dem nguoc luc nay:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

O day, `i` dai dien cho phan tu dang duoc lay ra, con phia sau `in` la du lieu can duoc lap, tuc la mang `countDown`.

Y nghia cua doan ma nay la: chuong trinh se lay tung phan tu trong mang `countDown` theo thu tu. Moi khi lay ra mot phan tu, no tam thoi dung `i` de dai dien cho phan tu do, sau do thuc hien ma trong dau ngoac nhon.

Qua trinh thuc thi co the hieu nhu sau:

- Lan dau tien lay ra `5`, nen luc nay gia tri cua `i` la `5`
- Thuc hien `print(i)`, in ra `5`
- Sau do tiep tuc lay phan tu ke tiep la `4`
- Lai thuc hien `print(i)` mot lan nua, in ra `4`

`3`, `2`, `1` phia sau cung se duoc thuc hien lan luot theo cung cach.

![for](../../Resource/017_for.png)

Khi tat ca cac phan tu trong mang da duoc xu ly xong, vong lap `for` se tu dong ket thuc.

Chung ta co the dung vong lap `for` de lay tung phan tu trong mang va hoan thanh cac chuc nang nhu dem nguoc.

**Luu y**: `i` la cach dat ten rat pho bien trong vong lap for, dung de bieu thi phan tu dang duoc lay ra, nhung day khong phai cach viet co dinh; ban cung co the dung cac ten tieng Anh khac.

Vi du, dung `num` de bieu thi tung phan tu duoc lay ra:

```swift
for num in countDown {
    print(num)
}
```

Trong dau ngoac nhon, ban cung can dung `num` de bieu thi phan tu dang duoc lay ra.

### Lap tren pham vi

Vong lap `for` khong chi co the lap qua mang ma con co the lap qua pham vi.

Vi du, khi chung ta can tinh tong cac so nguyen duong trong pham vi `50`, chung ta can cong lan luot tat ca cac so nguyen tu `1` den `50`.

Cach viet truc tiep nhat co the la:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Van de cua cach viet nay la chung ta phai tu tay viet ra tung con so, vua phiền phuc vua khong phu hop voi tinh huong phat trien thuc te.

Luc nay, chung ta co the dung toan tu pham vi ket hop voi vong lap `for` de hoan thanh viec nay.

Trong chuong “Toan tu” o truoc, chung ta da hoc toan tu pham vi:

```swift
1...3   // 1, 2, 3
```

Trong do, `...` bieu thi pham vi dong, tuc la bao gom ca diem bat dau va diem ket thuc.

Vi vay, o day chung ta co the dung vong lap `for` cho pham vi so nguyen tu `1` den `50`:

```swift
for i in 1...50 {
    
}
```

Chung ta can cong cac so nguyen nay lai, vi vay can them mot bien de luu tong:

```swift
var count = 0
```

Sau do, trong moi lan lap, cong so vua lay duoc vao `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Doan ma nay co nghia la:

- `count` dung de luu tong hien tai
- Vong lap `for` se lan luot lay cac so nguyen tu `1` den `50`
- Moi lan lay mot so nguyen, no se thuc hien `count += i`
- Sau khi vong lap ket thuc, `count` se luu tong cuoi cung.

Nhu vay, chung ta co the lay duoc tong cua tat ca cac so nguyen duong trong pham vi `50`.

Tuong tu, neu chung ta can tinh tong cac so nguyen tu `1` den `100`, chi can sua pham vi:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

Vong lap `for` khong chi co the lap qua mang ma con lap qua mot pham vi. Kha nang xu ly du lieu lap lai theo thu tu nay rat pho bien trong qua trinh phat trien.

No co the giup chung ta tu dong xu ly nhieu cong viec lap lai ma khong can tu tay viet tung phep cong cho moi con so, hay cac thao tac lap lai tuong tu khac.

## Vong lap trong SwiftUI

Vong lap `for` o phan truoc thuoc ve ngon ngu Swift.

Nhung trong SwiftUI, chung ta khong the truc tiep dung `for` ben trong cau truc view de tao view:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Do ben trong `VStack` can la cac SwiftUI view, con vong lap `for` thong thuong ban than no khong phai la mot view.

Neu chung ta muon lap lai giao dien trong SwiftUI dua theo noi dung cua mang, thi can dung `ForEach`.

Vi du, neu muon hien thi ten cua tat ca thanh vien trong mot nhom, chung ta co the viet:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Hieu ung hien thi:

![for1](../../Resource/017_for1.png)

Sau do, chung ta them cung mot modifier cho moi `Text`:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Luc nay, moi `Text` deu hien thi voi co chu nho hon va dam hon.

Hieu ung hien thi:

![](../../Resource/017_for2.png)

Tuy modifier lam giao dien dep hon, nhung cung khien ma dai hon va lap lai hon.

Neu ten tiep tuc tang len, hoac sau nay can dong bo chinh sua font, mau sac va cac kieu dang khac, chung ta se phai viet va sua lap lai rat nhieu ma giong nhau. Dieu nay kha bat tien va cung khong de bao tri.

Luc nay, chung ta co the dat cac ten nay vao mang truoc, sau do dung `ForEach` trong SwiftUI de lap lai viec tao view dua theo du lieu trong mang:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Doan ma nay ngan gon hon. `ForEach` se lan luot doc tung phan tu trong mang, roi hien thi noi dung tuong ung len giao dien.

Khi chung ta can them ten moi sau nay, chi can sua ten trong mang `names`, khong can moi lan lai them `Text` va cac modifier phuc tap.

## ForEach

`ForEach` la cau truc trong SwiftUI dung de lap lai viec tao view. Ban co the hieu no la mot cau truc giong nhu vong lap `for` trong SwiftUI.

Cach dung co ban:

```swift
ForEach(mang, id: \.self) { phanTu in
    maSwiftUI
}
```

Vi du, voi ten nhom luc nay:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Doan ma nay co nghia la:

`names` la mang duoc lap, cung chinh la du lieu can hien thi.

`id:\.self` co nghia la dung chinh phan tu trong mang de phan biet moi phan tu.

Trong vi du hien tai, mang dang luu cac chuoi:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Vi vay, SwiftUI se truc tiep dung chinh cac chuoi "Sam", "John", "Wathon", "Bob" de phan biet cac noi dung khac nhau.

Voi cac mang don gian thuong gap o giai doan moi hoc nhu String, Int, chung ta thuong co the viet:

```swift
id: \.self
```

Bay gio ban chi can nho cach viet nay la duoc, chua can tim hieu sau hon ve cac quy tac id.

`item in` co nghia la `item` la phan tu dang duoc lay ra.

Vi du, o lan lap dau tien, `item` la `"Sam"`; o lan lap thu hai, `item` la `"John"`.

Vi vay:

```swift
Text(item)
```

Se lan luot tro thanh:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Do do, tac dung cua doan ma nay la: lan luot lay tung ten tu mang `names`, va tao mot `Text` view cho moi ten.

### Qua trinh thuc thi

Qua trinh thuc thi co the hieu nhu sau:

- `ForEach` truoc tien doc phan tu dau tien `"Sam"` trong mang `names`
- `item` tam thoi dai dien cho `"Sam"`
- `Text(item)` hien thi `"Sam"`
- Sau do tiep tuc doc phan tu ke tiep `"John"`
- Roi lap lai cung mot doan ma view nhu tren

Cuoi cung, tat ca cac ten trong mang deu se duoc hien thi ra.

Cach viet nay co uu diem la: khi so luong ten tang len, chung ta khong can lap lai nhieu `Text`, chi can sua noi dung cua mang la du.

### Lap qua anh

`ForEach` khong chi hien thi van ban, ma con co the hien thi hinh anh, mau sac, hoac cac SwiftUI view khac.

Vi du, chung ta chuan bi 4 hinh anh:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Keo bon hinh anh nay vao thu muc Assets cua Xcode.

![image](../../Resource/017_for3.png)

Neu khong dung `ForEach`, chung ta phai tu tay viet tung hinh anh:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Hieu ung hien thi:

![image](../../Resource/017_for4.png)

Cach viet nay van co the dat muc tieu, nhung ma se kha dai.

Neu so luong anh ngay cang nhieu, chung ta se phai viet ngay cang nhieu doan `Image`.

Neu sau nay muon dong bo chinh sua kich thuoc anh, chung ta cung phai sua tung anh mot.

Luc nay, chung ta co the dat ten hinh anh vao mang, sau do dung `ForEach` de lap lai viec tao image view:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

`images` o day la mot mang chuoi, moi phan tu trong mang deu la ten hinh anh.

`ForEach(images, id: \.self)` co nghia la lan luot doc tung phan tu trong mang `images`, dung chinh phan tu do de phan biet moi muc, roi tao view tuong ung dua tren phan tu hien tai.

Vi du, neu lan dau doc duoc `"430F9BEF"`, thi:

```swift
Image(item)
```

Se tuong duong voi:

```swift
Image("430F9BEF")
```

Nhung hinh anh phia sau cung se duoc hien thi lan luot theo cach tuong tu.

![image](../../Resource/017_for4.png)

O day van tiep tuc dung:

```swift
id: \.self
```

Ly do giong nhu truoc, boi vi cac phan tu trong mang `images` cung la kieu chuoi don gian, nen o giai doan moi hoc chi can truc tiep dung chinh phan tu do de phan biet la du.

Ban co the hieu don gian no nhu mot cong thuc co dinh:

**Khi `ForEach` lap qua mot mang don gian nhu `String` hoac `Int`, thong thuong se viet `id: \.self`.**

### Them hinh anh

Neu sau nay can them hinh anh, chi can sua noi dung cua mang:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Khong can viet lap lai them ma `Image` moi.

Neu co nhieu anh, ban co the ket hop them `ScrollView`, neu khong thi khi noi dung vuot qua man hinh se khong the xem day du.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Sua hinh anh

Khi chung ta can dong bo chinh sua kieu dang hinh anh, chi can sua ma ben trong `ForEach`.

Vi du, doi chieu rong thanh `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Nhu vay, tat ca hinh anh se duoc sua cung luc, khong can sua tung tam mot.

Day la mot tac dung quan trong cua `ForEach`:

**Khi nhieu view co cung cau truc va chi khac nhau o noi dung, ban co the chi viet mot phien ban ma view, sau do de du lieu trong mang quyet dinh noi dung duoc hien thi.**

## Tong ket

Trong bai hoc nay, chung ta da hoc vong lap `for` va `ForEach`.

Vong lap `for` dung de xu ly cac phan tu trong mang hoac pham vi theo thu tu, nghieng ve xu ly du lieu hon.

`ForEach` dung de lap lai viec tao view trong SwiftUI dua theo noi dung cua mang, nghieng ve hien thi giao dien hon.

O giai doan moi hoc hien tai, cach viet pho bien nhat cua `ForEach` la:

```swift
ForEach(mang, id: \.self) { phanTu in
    maSwiftUI
}
```

Trong do, `id: \.self` co nghia la dung chinh phan tu do de phan biet moi phan tu.

Khi noi dung trong mang la cac kieu don gian nhu `String`, `Int`, chung ta thuong co the uu tien dung cach viet nay.

Sau nay, khi duyet web hoac dung App, neu ban thay mot nhom van ban, hinh anh hay noi dung danh sach lap lai, ban co the nghi den viec trong SwiftUI nhung noi dung nay thuong duoc dat vao mang truoc, sau do hien thi lan luot bang `ForEach`.
