# Tiki-Interview-Test
This is the project that I did in the test examination when interviewing at Dwarves company.

# Requirements:
Ứng dụng Tweeter cho phép người dùng nhập 1 đoạn tweet không quá 50 kí tự. 
Trong trường hợp user nhập văn bản dài hơn 50 kí tự, ứng dụng sẽ cắt thành các sub tweet và post lên mạng xã hội.
Nếu tweet là một chuỗi các các kí tự liên tiếp, không có khoảng trắng có độ dài lớn hơn 50 thì báo lỗi nhập liệu.
+Các sub tweet sẽ được thêm tiền tố để chỉ ra sub tweet là tweet thứ tự số bao nhiêu trong tổng số tweet được chia nhỏ.
+ Các sub tweet được cắt tại kí tự khoảng trắng (whitespace character) và ưu tiên tiệm cận 50 kí tự nếu có thể.
Ví dụ: 

    Cho đoạn tweet 1:
        “The quick brown fox jumps over the lazy dog”  => 43 kí tự < 50
        Sẽ  thành post: “The quick brown fox jumps over the lazy dog”

    Cho đoạn tweet 2:
        “The quick brown fox jumps over the lazy dog The quick brown fox jumps over the lazy dog” => 87 kí tự sẽ thành:
        “1/2 The quick brown fox jumps over the lazy dog” => 47 kí tự, không thể thêm “ The” vì sẽ thành 51 kí tự.
        “2/2 The quick brown fox jumps over the lazy dog” => 47 kí tự.

    Cho đoạn tweet 3:
        “ThequickbrownfoxjumpsoverthelazydogThequickbrownfoxjumpsoverthelazydog” => 70 kí tự
        Báo lỗi vì Tweet trên là 1 chuỗi span of nonwhite space character > 50

Bạn hãy viết ứng dụng iOS cho phép người dùng nhập vào 1 đoạn tweet và thể hiện lên UITableView.
Cell show ra Tweet/ sub tweet , tổng số kí tự mỗi sub.
Lưu ý, phần tiền tố có thể ảnh hưởng đến tổng độ dài của sub tweet. (“ ‘1/2  ‘=> 4 kí tự => sub tweet còn lại 46 chỗ trống”.
Yêu cầu viết bằng swift 4, up lên github.
Điểm cộng cho code bao gồm Unit test và các kĩ năng UI để làm đẹp cho ứng dụng.

# Dependencies description:
- SnapKit: To help me auto layout easier

# Algorithm description:
- Step 1: Split the message into the list words.
- Step 2: Predict x=ceil(message.count/maxLengthOfMessage).digiCount (x is number of digits of the number of messages (n) can be split). Ex:
   + If 1<n<10 ==> x=1
   + If 9<n<100 ==> x=2
   + If 99<n<1000 ==> x=3
- Step 3: Browse the words list and try to split the original message while checking the length limit with the length of splitedMessage include part indicator known.
- Step 4: Check the number of digits of the number of splitedMessagesArray with x:
   + if NOT EQUAL: assign x = num of digits of the number of splitedMessagesArray. Then come back the Step 3.
   + if EQUAL: Browse the splitedMessagesArray and update each of message with the correct part indicator. Then continues Step 5.
- Step 5: return splitedMessageArray.



