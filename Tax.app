<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>طلب تاكسي</title>
</head>
<body>
    <h1 style="text-align: center;">طلب أقرب سائق</h1>
    <button id="requestDriver" style="display: block; margin: 0 auto;">طلب أقرب سائق</button>
    <p id="output" style="text-align: center;"></p>

    <script>
        document.getElementById('requestDriver').addEventListener('click', function() {
            if (navigator.geolocation) {
                // طلب إذن تحديد الموقع
                navigator.geolocation.getCurrentPosition(
                    function(position) {
                        const latitude = position.coords.latitude;
                        const longitude = position.coords.longitude;

                        // إحداثيات الوجهة (مثال، يمكن تغييرها لاحقًا حسب الطلب)
                        const destinationLatitude = 31.963158; // مثال: إحداثيات الوجهة
                        const destinationLongitude = 35.930359;

                        // فتح تطبيق الخرائط المدمج لتوجيه السائق
                        const url = `https://www.google.com/maps/dir/?api=1&origin=${latitude},${longitude}&destination=${destinationLatitude},${destinationLongitude}&travelmode=driving`;
                        window.open(url, '_blank');
                    },
                    function(error) {
                        switch (error.code) {
                            case error.PERMISSION_DENIED:
                                document.getElementById('output').innerText = "تم رفض الإذن.";
                                break;
                            case error.POSITION_UNAVAILABLE:
                                document.getElementById('output').innerText = "معلومات الموقع غير متوفرة.";
                                break;
                            case error.TIMEOUT:
                                document.getElementById('output').innerText = "انتهت مدة الطلب.";
                                break;
                            case error.UNKNOWN_ERROR:
                                document.getElementById('output').innerText = "حدث خطأ غير معروف.";
                                break;
                        }
                    }
                );
            } else {
                document.getElementById('output').innerText = "المتصفح الخاص بك لا يدعم تحديد الموقع.";
            }
        });
    </script>
</body>
</html>