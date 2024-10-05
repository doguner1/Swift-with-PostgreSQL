# SwiftUI ile PostgreSQL'e Veri Eklemek

Bu proje, SwiftUI kullanarak bir kullanıcı kayıt ve giriş sistemi geliştirmeyi hedeflemektedir. Node.js ve PostgreSQL ile backend yapısını kurarak, kullanıcı bilgilerini güvenli bir şekilde saklamaktadır.

## İçindekiler

- [Başlangıç](#başlangıç)
- [Özellikler](#özellikler)
- [Teknolojiler](#teknolojiler)
- [Kurulum](#kurulum)
- [Kullanım](#kullanım)
- [Kod Yapısı](#kod-yapısı)
- [Resimler](#resimler)

## Başlangıç

Bu proje, kullanıcıların kayıt olmasını ve giriş yapmasını sağlamak için bir arayüz ve bir backend sunmaktadır. Kullanıcı bilgileri PostgreSQL veritabanında saklanmaktadır.

## Özellikler

- Kullanıcı kaydı
- Güvenli şifreleme
- Kullanıcı girişi
- Hata yönetimi

## Teknolojiler

- **SwiftUI**: Kullanıcı arayüzü geliştirmek için.
- **Node.js**: Backend geliştirmek için.
- **PostgreSQL**: Veri saklama için.
- **pgcrypto**: Şifreleme işlemleri için.

## Kurulum

1. **PostgreSQL** veritabanını kurun.
2. Aşağıdaki SQL komutunu kullanarak `users` tablosunu oluşturun:

   ```sql
   CREATE TABLE users (
       id SERIAL PRIMARY KEY,
       kname TEXT NOT NULL UNIQUE,
       email TEXT NOT NULL UNIQUE,
       password TEXT NOT NULL
   );
   ```
3. pgcrypto eklentisini kurun:

   ```sql
    CREATE EXTENSION IF NOT EXISTS pgcrypto;
   ```
4. Node.js uygulamasını indirin ve gerekli bağımlılıkları yükleyin:

   ```bash
     npm install express pg
   ```
    
5. JavaScript dosyasını çalıştır
    ```bash
     node index.js
    ```

## Kullanım

Kullanıcılar, kayıt olmak için aşağıdaki API'yi kullanabilirler:

### Kullanıcı Kaydı
### Gerekli Parametreler:
- `kname`: Kullanıcı adı
- `email`: Kullanıcı e-postası
- `password`: Kullanıcı şifresi

Kullanıcılar, giriş yapmak için aşağıdaki API'yi kullanabilirler:

## Kullanıcı Girişi
### Gerekli Parametreler:
- `email`: Kullanıcı e-postası
- `password`: Kullanıcı şifresi

## Kod Yapısı

Aşağıda projenin önemli kod parçaları bulunmaktadır.

### PostgreSQL Bağlantısı

```javascript
const { Pool } = require('pg');
const pool = new Pool({
    user: 'username',
    host: 'localhost',
    database: 'your_database',
    password: 'your_password',
    port: 5432,
});

app.post('/add-user', async (req, res) => {
    const { kname, email, password } = req.body;
    // ...
});

app.post('/login', async (req, res) => {
    const { email, password } = req.body;
    // ...
});
```

### Swift Kullanıcı Ekleme ve Çekme
```swift
        func register() {
        let body: [String: Any] = ["kname": username, "email": email, "password": password]
        guard let request = createRequest(endpoint: "add-user", body: body) else { return }
        sendRequest(request: request)
    }
        func login() {
        let body: [String: Any] = ["email": email, "password": password]
        guard let request = createRequest(endpoint: "login", body: body) else { return }
        sendRequest(request: request)
    }
```

## Resimler
![Ekran Resmi](https://github.com/doguner1/GitImageData/blob/main/PostgreSQLNode/Ekran%20Resmi%202024-10-05%2018.43.44.png?raw=true)


![Ekran Resmi](
https://github.com/doguner1/GitImageData/blob/main/PostgreSQLNode/Ekran%20Resmi%202024-10-05%2018.44.10.png?raw=true)


![Ekran Resmi](https://github.com/doguner1/GitImageData/blob/main/PostgreSQLNode/Ekran%20Resmi%202024-10-05%2018.47.03.png?raw=true)


![Ekran Resmi](https://github.com/doguner1/GitImageData/blob/main/PostgreSQLNode/Ekran%20Resmi%202024-10-05%2018.50.49.png?raw=true)
