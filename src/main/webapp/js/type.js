$(document).ready(function() {
        // 폼 입력 값이 변경될 때마다 확인
        $('#submitButton').prop('disabled', true);
        
        $('.form-control').change(function() {
            // 모든 입력 필드의 값을 가져옴
            var code = $('#code').val();
            var name = $('#name').val();
            var content = $('#content').val();
            var price = $('#price').val();
            var date = $('#date').val();


            // 모든 필드가 채워져 있는지 확인
            if (code != '' && name != '' && content != '' && price != '' && date != '') {
                // 모든 필드가 채워져 있으면 수정 버튼 활성화
                $('#submitButton').prop('disabled', false);
            } else {
                // 하나라도 빈칸이 있으면 수정 버튼 비활성화
                $('#submitButton').prop('disabled', true);
            }
        });
    });