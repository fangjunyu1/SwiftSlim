# Danh Sach Phim

Trong bai hoc nay, chung ta se tao mot danh sach phim.

![movie](../../Resource/021_movie.png)

Danh sach se hien thi ap phich, ten, dao dien va diem danh gia cua tung bo phim.

Trong vi du nay, chung ta se hoc mot khai niem rat quan trong: cau truc `struct`. No co the giup chung ta gom nhieu thong tin cua mot bo phim thanh mot tong the. Ngoai ra, chung ta cung se lam quen voi `UUID()`, `ForEach`, duong phan cach `Divider`, va cach su dung doi tuong tuy chinh de quan ly du lieu.

Nhung kien thuc nay rat pho bien trong qua trinh phat trien SwiftUI ve sau. Sau khi hoc xong bai nay, ban khong chi co the tao mot danh sach phim, ma con bat dau hieu duoc "cach hien thi mot tap du lieu thanh giao dien."

## Mot Bo Phim

Chung ta co the bat dau bang viec tao giao dien cho mot bo phim don le.

![movie](../../Resource/021_movie1.png)

Bo cuc cua giao dien nay chu yeu gom hai phan: ben trai la ap phich phim, ben phai la phan gioi thieu phim.

### Ap Phich Phim

Ben trai hien thi ap phich phim, va chung ta co the dung `Image` de hien thi hinh anh.

Vi du:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Doan ma nay co nghia la hien thi mot hinh anh co ten `"The Shawshank Redemption"`.

Mot dieu can luu y o day la ten hinh anh phai thuc su ton tai trong thu muc tai nguyen `Assets`. Neu khong, giao dien se khong the hien thi dung hinh anh nay.

![movie](../../Resource/021_movie2.png)

Chuc nang cua cac modifier nay la:

- `resizable()` nghia la co the thay doi kich thuoc hinh anh.
- `scaledToFit()` nghia la giu nguyen ti le goc khi phong to thu nho de tranh hinh anh bi keo gian hoac bien dang.
- `frame(height: 180)` nghia la dat chieu cao hinh anh la 180.
- `cornerRadius(10)` nghia la dat bo goc tron cho hinh anh voi ban kinh 10.

Bang cach nay, chung ta se co duoc mot ap phich phim co kich thuoc phu hop va cac goc duoc bo tron.

![movie](../../Resource/021_movie3.png)

### Gioi Thieu Phim

Ben phai hien thi phan gioi thieu phim, bao gom ten phim, dao dien va diem danh gia.

![movie](../../Resource/021_movie4.png)

Chung ta co the dung `Text` de hien thi phan noi dung nay:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

Trong doan ma nay, `.font` bieu thi kich thuoc chu, con `.fontWeight` bieu thi do dam cua chu.

De khoang cach giua "ten phim", "thong tin dao dien" va "thong tin diem danh gia" ro rang hon, o day chung ta dung `VStack` o lop ngoai cung va dat:

```swift
spacing: 10
```

Dieu nay co nghia la khoang cach giua tung nhom noi dung ben trong `VStack` nay la 10.

Ly do dao dien va diem danh gia moi phan lai dung them mot `VStack` nua la vi chung deu thuoc cau truc "tieu de + noi dung". Nho vay, cap bac cua giao dien tro nen ro rang hon, dong thoi viec dieu chinh kieu dang sau nay cung thuan tien hon.

Ngoai ra, `VStack` mac dinh se can giua. De can tat ca van ban sang trai, chung ta dat:

```swift
alignment: .leading
```

Dieu nay giup phan gioi thieu phim trong gon hon.

### Divider

Luc nay, mac du noi dung trong phan gioi thieu phim da duoc tach khoang boi `spacing`, ranh gioi giua cac phan noi dung van chua du ro rang.

Luc nay, chung ta co the them mot duong phan cach:

```swift
Divider()
```

Vi du:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

Nhu vay, phan gioi thieu phim se co hieu ung phan tach ro hon.

![movie](../../Resource/021_movie4.png)

`Divider` la mot view rat don gian nhung duoc dung rat thuong xuyen, co vai tro tach cac noi dung khac nhau.

Trong `VStack`, `Divider()` duoc hien thi thanh mot duong ngang.

Trong `HStack`, `Divider()` duoc hien thi thanh mot duong doc.

Ngoai ra, chung ta cung co the thay doi kieu dang cua `Divider` thong qua `.frame`, `.background`, `.padding` va nhung cach khac.

Vi du:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Doan nay tao ra mot duong phan cach mau xanh, do day 2 va co khoang dem ngang o hai ben.

![divider](../../Resource/021_divider.png)

### Giao Dien Hoan Chinh

Cuoi cung, chung ta co the dung `HStack` de sap xep ap phich phim va phan gioi thieu phim nam canh nhau.

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

O day, `HStack(spacing: 20)` co nghia la co khoang cach 20 giua phan ben trai va ben phai.

Can luu y rang `Divider()`, giong nhu `TextField` va `Slider` da duoc nhac truoc do, mac dinh se co gang chiem nhieu khong gian kha dung nhat co the.

Vi vay, chung ta dat mot chieu rong co dinh cho `VStack` ngoai cung cua phan gioi thieu ben phai:

```swift
.frame(width: 200)
```

Dieu nay giup chieu rong cua duong phan cach va khu vuc van ban dong nhat, lam cho tong the bo cuc gon gang hon.

Den day, chung ta da hoan thanh giao dien hien thi cho "mot bo phim".

![movie](../../Resource/021_movie1.png)

## Luu Phim Trong Mang

Neu chung ta muon hien thi nhieu bo phim lan luot theo cung mot kieu, dieu do co nghia la can phai viet lai doan ma tuong tu cho moi bo phim.

Vi du:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

Mac du cach viet nay co the tao ra ket qua mong muon, nhung ma se ngay cang dai va rat bat tien cho viec bao tri.

Vi du, neu chung ta can doi khoang cach cua tat ca phim tu `20` thanh `15`, hoac doi chieu rong ben phai tu `200` thanh
`220`, thi chung ta se phai sua thu cong tung doan ma lap lai.

Ro rang day khong phai la mot cach hieu qua.

Truoc do, chung ta da hoc ve mang, va cung da hoc cach dung `ForEach` de hien thi lap lai views dua tren mot mang.

Vi du:

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

Cach tiep can nay rat phu hop cho nhung truong hop chi co "mot loai du lieu duy nhat", nhu mot nhom ten hinh anh.

Tuy nhien, mot bo phim khong chi co mot gia tri. It nhat no gom:

1. ap phich phim
2. ten phim
3. dao dien
4. diem danh gia

Noi cach khac, mot bo phim thuc su la mot tap hop du lieu lien quan, khong chi la mot chuoi don le.

Neu chi dung mang, chung ta chi co the luu nhung thong tin nay mot cach tach rieng:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Khi hien thi, chung ta phai dua vao cung mot chi so de ghep tung phan lai voi nhau:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

Van de cua cach viet nay la chi phi bao tri rat cao.

Vi du lieu cua mot bo phim bi tach ra tren nhieu mang, chi can mot mang co thua mot phan tu, thieu mot phan tu, hoac thu tu khac di, thi ket qua hien thi se sai.

Dac biet khi them hoac xoa phim, ban phai cap nhat nhieu mang cung luc, va rat de bo sot mot phan nao do.

Vay lam the nao de gom nhung thong tin nhu "ten phim, dao dien, diem danh gia" thanh mot khoi thong nhat?

Dieu nay can den `struct`.

## Dinh Nghia `struct`

Trong Swift, `struct` co nghia la "cau truc".

Ban co the hieu no nhu mot "kieu du lieu tuy chinh" co the ket hop nhieu truong lien quan thanh mot tong the.

Cach dung co ban:

```swift
struct StructName {
	let name: String
}
```

Trong doan ma nay, `struct` la tu khoa cho biet chung ta dang dinh nghia mot cau truc. `StructName` la ten cua cau truc do.

Noi dung ben trong dau ngoac nhon la tap hop cac truong ma cau truc nay chua, va moi truong deu phai ghi ro ten va kieu.

Thong thuong, ten cua `struct` se bat dau bang chu cai viet hoa, nhu `Movie`, `Student`, `UserInfo`. Day la mot quy uoc dat ten pho bien trong Swift.

Ban co the don gian tuong tuong `struct` nhu mot chiec hop rong, trong do moi truong giong nhu mot vi tri trong duoc danh san.

Khi nhung vi tri nay chua duoc dien gia tri, no chi la mot chiec hop rong. Chi sau khi tat ca cac truong duoc dien bang nhung gia tri phu hop thi no moi tro thanh mot chiec hop hoan chinh.

### Instance cua `struct`

Truoc do, chung ta moi chi dinh nghia cau truc, tuc la moi chuan bi hinh dang cua chiec hop.

Chung ta van can dien noi dung thuc te vao do de co duoc mot "instance" that su co the su dung.

Khi tao instance, chung ta thuong them `()` sau ten cau truc:

```swift
StructName(...)
```

Ben trong dau ngoac tron la noi dung cac truong ma cau truc nay can.

Vi du:

```swift
StructName(name: "Fang Junyu")
```

Doan ma nay co nghia la: tao mot instance moi theo dinh dang cua cau truc `StructName`, va gan gia tri `"Fang Junyu"` cho truong `name`.

Khi chung ta dien day du tat ca cac gia tri can thiet, dieu do giong nhu viec lap day chiec hop.

Luci nay, chung ta se co mot instance cau truc hoan chinh.

### Truy Cap Thuoc Tinh cua `struct`

Sau khi tao instance, chung ta co the dung cu phap dau cham de truy cap cac thuoc tinh ben trong no.

Cu phap co ban:

```swift
instance.propertyName
```

Vi du:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

O day, `st` la mot instance cua cau truc, va `st.name` co nghia la doc gia tri `name` tu instance do.

Ban co the hieu cach doc nay nhu sau: khi chung ta viet `st.name`, no giong nhu viec doc noi dung duoc dat o mot vi tri nao do ben trong chiec hop.

Kieu viet nay se xuat hien rat nhieu trong cac giao dien SwiftUI ve sau.

Vi du, neu chung ta co mot cau truc hoc sinh bao gom ten, tuoi va lop, khi hien thi trong giao dien, chung ta co the doc rieng:

```swift
student.name
student.age
student.className
```

Loi ich cua cach lam nay la du lieu tro nen ro rang hon va de quan ly hon.

### Vi Tri cua `struct`

Voi nguoi moi hoc, thong thuong viec viet cau truc ben ngoai `ContentView` se de hieu hon.

Vi du:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Nhu vay, cau truc se ro rang hon va de doc hon.

Ban se nhan ra rang ban than `ContentView` thuc ra cung la mot `struct`.

### Cau Truc `Movie`

Voi nen tang o tren, chung ta co the dinh nghia mot cau truc phim:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Day la mot cau truc co ten `Movie`, gom ba truong `name`, `director` va `rating`, lan luot bieu thi ten phim, dao dien va diem danh gia.

Nhu vay, thong tin lien quan den mot bo phim khong can phai tach thanh nhieu mang nua, ma co the duoc gom truc tiep thanh mot tong the.

Vi du, chung ta co the tao mot instance phim nhu sau:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Instance nay dai dien cho "mot bo du lieu phim hoan chinh."

### Luu Cau Truc Trong Mang

Truoc do, chung ta da noi rang mot mang chi co the luu mot kieu du lieu.

Bay gio, khi da co cau truc `Movie`, mang co the luu nhieu gia tri `Movie`.

```swift
let lists: [Movie] = []
```

Vi du:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Trong mang `lists` nay, nhung gi duoc luu khong phai la chuoi, ma la nhieu instance `Movie`.

Tuc la moi phan tu trong mang la mot bo phim hoan chinh.

Nhu vay, khi can hien thi danh sach phim, chung ta co the dung `ForEach` de doc tung bo phim lan luot.

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

O day, `movie in` co nghia la trong moi vong lap, mot bo phim se duoc lay ra tu mang va tam thoi duoc dat ten la `movie`.

Sau do, chung ta co the dung:

```swift
movie.name
movie.director
movie.rating
```

de doc ten, dao dien va diem danh gia cua bo phim do, roi hien thi chung tren giao dien.

## Loi `ForEach`

Den day, chung ta da hoan thanh cach viet co ban cho mang phim va `ForEach`.

Tuy nhien, neu ban chay truc tiep doan ma sau:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

ban se gap loi:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Y nghia cua loi nay la khi ban viet `id: \.self`, SwiftUI can xem moi phan tu trong mang la mot "dinh danh duy nhat" de co the phan biet chung.

Cach viet nay phu hop voi nhung kieu don gian nhu `String` va `Int`, boi vi ban than chung de phan biet hon.

Nhung `Movie` la mot cau truc tuy chinh do chung ta tu dinh nghia, va `ForEach` khong biet cach xem ban than cau truc nay nhu mot dinh danh duy nhat, nen no bao loi.

Cach pho bien nhat de giai quyet van de nay la lam cho `Movie` tuan theo protocol `Identifiable`.

## Protocol

Trong Swift, protocol co the duoc hieu nhu mot dang "quy tac" hoac "yeu cau".

Ban co the hinh dung no giong nhu mot thoa thuan trong mot to chuc quoc te: neu mot quoc gia muon tham gia vao mot to chuc quoc te nao do, thuong thi no can dap ung mot so quy tac do to chuc de ra, cong bo mot so du lieu va tuan thu cac quy dinh chung. Chi sau khi dap ung nhung dieu kien do, no moi co the tham gia hoac du vao mot so cong viec.

Protocol cung hoat dong theo cach tuong tu.

Khi mot kieu du lieu muon tuan theo mot protocol nao do, no can dap ung nhung noi dung ma protocol ay yeu cau. Chi sau khi dap ung nhung yeu cau do, kieu du lieu ay moi co the su dung cac chuc nang tuong ung.

Cu phap co ban:

```swift
struct Movie: Identifiable {
    // ...
}
```

O day, `: Identifiable` co nghia la `Movie` tuan theo protocol `Identifiable`.

Neu mot kieu du lieu tuan theo nhieu protocol cung luc, chung co the duoc tach boi dau phay:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Voi `Identifiable`, yeu cau quan trong nhat la kieu do can co mot `id` co the xac dinh chinh no.

Vi du:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

O day, `id` giong nhu so the dinh danh va duoc dung de phan biet tung bo phim.

Chi can `id` cua moi phim la khac nhau, SwiftUI co the phan biet dung tung phan tu trong mang.

Vi du:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Sau do dung trong `ForEach` nhu sau:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Nhu vay se khong con loi nua.

Vi `Movie` da tuan theo `Identifiable`, mot cach viet pho bien hon la bo qua truc tiep `id:`:

```swift
ForEach(lists) { movie in
    // ...
}
```

Vi SwiftUI da biet can dung `movie.id` de phan biet tung muc.

## Dinh Danh Phan Biet Trong `ForEach`

Tiep theo, chung ta se hieu sau hon ve vai tro cua `id` trong `ForEach`.

Vi du:

```swift
ForEach(lists, id: \.self)
```

Dieu nay co nghia la: dung ban than phan tu lam dinh danh phan biet.

Con:

```swift
ForEach(lists, id: \.id)
```

co nghia la: dung truong `id` cua phan tu lam dinh danh phan biet.

Neu mot truong nao do tu no da dam bao tinh duy nhat, no cung co the duoc dung tam thoi.

Vi du, neu moi bo phim deu co ten khac nhau, thi doan ma sau cung co the hoat dong dung voi bo du lieu hien tai:

```swift
ForEach(lists, id: \.name)
```

Nhung o day co mot van de an: `name` khong dam bao luc nao cung la duy nhat.

Gia su sau nay ban them mot bo phim khac co cung ten, khi do `name` se khong con the phan biet chinh xac tung phan tu nua.

Luc do, du ma van co the bien dich, SwiftUI van co the nhan dien sai cac phan tu trong qua trinh lam moi view, cap nhat, chen them hoac xoa, dan den loi hien thi.

Vi vay, khi can phan biet du lieu on dinh, tot nhat van nen dung truong that su duy nhat, do la `id`.

## UUID

Mac du viec tu viet `id: 1`, `id: 2` co the giai quyet van de, van con mot rui ro: ban co the vo tinh viet trung `id`, va khi do dinh danh duy nhat se mat tac dung.

Vi du:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Nhu vay se xuat hien hai gia tri `id` giong nhau, va dinh danh duy nhat se mat hieu luc.

De tranh loi thu cong, chung ta thuong dung `UUID()`.

Trong Swift, `UUID()` tao ngau nhien mot dinh danh 128-bit. No thuong duoc hien thi nhu mot chuoi dai gom chu cai va chu so.

Vi du:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

O day, `UUID()` thuc ra tao ra mot instance cua kieu `UUID`. Ban co the xem no nhu mot "so duy nhat" duoc tao tu dong.

Vi the, gia tri duoc tao ra moi lan gan nhu khong bao gio lap lai, nen rat phu hop de dung lam `id`.

Chung ta co the sua `Movie` nhu sau:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Doan ma nay co nghia la truong `id` trong cau truc `Movie` se mac dinh duoc gan mot instance `UUID` moi.

Noi cach khac, moi lan chung ta tao mot `Movie` moi, he thong se tu dong sinh cho chung ta mot `id` duy nhat truoc.

Vi `id` da co gia tri mac dinh, chung ta khong con can dien thu cong `id` khi tao cac instance `Movie` sau nay.

Vi du:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Mac du o day khong viet `id`, tren thuc te moi instance phim van co `id` rieng; chi la gia tri nay da duoc `UUID()` tao san mot cach tu dong.

Sau khi dung cach nay, chung ta khong can dien thu cong `id` cho tung bo phim nua, dieu nay khong chi giam luong ma ma con tranh duoc loi do trung lap id.

Cuoi cung, chung ta chi can them mot hinh `Banner` o phia tren va dung `ScrollView` de noi dung co the cuon, khi do toan bo giao dien danh sach phim se hoan chinh.

## Tong Ket

Trong bai hoc nay, chung ta da hoc mot khai niem rat quan trong: `struct`.

Thong qua `struct`, chung ta co the ket hop nhieu truong lien quan cua mot bo phim thanh mot tong the, thay vi tach ten, dao dien va diem danh gia thanh nhieu mang.

Sau khi du lieu duoc ket hop, chung ta co the dung `ForEach` de hien thi tung bo phim trong mang lan luot trong view.

Dong thoi, chung ta cung da hieu vai tro cua "dinh danh phan biet" trong `ForEach`: SwiftUI phai biet cach phan biet tung phan tu trong mang de co the hien thi va cap nhat view mot cach chinh xac.

Vi vay, chung ta da cho `Movie` tuan theo protocol `Identifiable` va cung cap cho no mot `id` duy nhat.

De tranh sai sot khi dien thu cong `id`, chung ta tiep tuc hoc `UUID()` de he thong co the tu dong sinh dinh danh duy nhat.

Sau khi hoc xong bai nay, ban khong chi hoan thanh danh sach phim, ma con bat dau tiep can mot y tuong quan trong trong SwiftUI: **sap xep du lieu truoc, sau do tao view dua tren du lieu.**

## Ma Hoan Chinh

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
