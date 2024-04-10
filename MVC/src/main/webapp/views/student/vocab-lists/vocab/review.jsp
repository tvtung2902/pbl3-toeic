<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.VocabModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flashcard App</title>
    <style>
        /* CSS styles */
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            text-align: center;
        }

        .flashcard {
            width: 200px;
            height: 150px;
            background-color: #f3f3f3;
            border-radius: 10px;
            margin-bottom: 20px;
            position: relative;
            cursor: pointer;
            transition: transform 0.8s;
            transform-style: preserve-3d;
        }

        .flashcard:hover  {
            transform: rotateY(180deg);
        }

        .front,
        .back {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            position: absolute;
            backface-visibility: hidden;
        }

        .front {
            z-index: 2;
        }

        .back {
            transform: rotateY(180deg);
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4caf50;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container" id="flashcardContainer">
        <!-- Phần tử này chứa dữ liệu của các thẻ Flashcard, nhưng nó không hiển thị trên giao diện -->
        <div id="flashcardData" style="display: none;">
        <%for(VocabModel v : (LinkedList<VocabModel>)request.getAttribute("vocabModels")){ %>
            <div data-front=<%=v.getVocab() %> data-back=<%=v.getMean()%>> </div>
            <%} %>
        </div>

        <!-- Thẻ Flashcard sẽ được hiển thị ở đây -->
        <div class="flashcard" id="flashcard">
            <div class="front">Front Text</div>
            <div class="back">Back Text</div>
        </div>

        <!-- Nút để chuyển sang thẻ Flashcard tiếp theo -->
        <button id="nextBtn">Next Card</button>
    </div>

    <script>
        // Lấy các phần tử cần thiết từ HTML
        const flashcardContainer = document.getElementById('flashcardContainer');
        const flashcardDataContainer = document.getElementById('flashcardData');
        const flashcard = document.getElementById('flashcard');
        const nextBtn = document.getElementById('nextBtn');

        // Biến để theo dõi thẻ flashcard hiện tại
        let currentCard = 0;

        // Hàm tạo thẻ Flashcard
        function createFlashcard(front, back) {
            const flashcard = document.createElement('div');
            flashcard.classList.add('flashcard');

            const frontDiv = document.createElement('div');
            frontDiv.classList.add('front');
            frontDiv.textContent = front;

            const backDiv = document.createElement('div');
            backDiv.classList.add('back');
            backDiv.textContent = back;

            flashcard.appendChild(frontDiv);
            flashcard.appendChild(backDiv);

            return flashcard;
        }

        // Hàm tải dữ liệu của thẻ Flashcard từ HTML
        function loadFlashcards() {
            const flashcardData = Array.from(flashcardDataContainer.children).map(card => ({
                front: card.getAttribute('data-front'),
                back: card.getAttribute('data-back')
            }));

            const currentFlashcard = flashcardData[currentCard];
            flashcard.querySelector('.front').innerText = currentFlashcard.front;
            flashcard.querySelector('.back').innerText = currentFlashcard.back;
        }

        // Sự kiện khi nhấp vào thẻ Flashcard để lật nó
        flashcard.addEventListener('click', () => {
            flashcard.classList.toggle('flipped');
        });

        // Sự kiện khi nhấp vào nút "Next Card" để chuyển sang thẻ Flashcard tiếp theo
        nextBtn.addEventListener('click', () => {
            currentCard++;
            if (currentCard >= flashcardDataContainer.children.length) {
                currentCard = 0; // Quay lại thẻ đầu tiên nếu đã đến cuối
            }
            loadFlashcards();
            flashcard.classList.remove('flipped');
        });

        // Tải thẻ flashcard đầu tiên khi trang được tải
        window.addEventListener('DOMContentLoaded', () => {
            loadFlashcards();
        });
    </script>
</body>
</html>
