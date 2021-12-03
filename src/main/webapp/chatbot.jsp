<%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 12/2/21
  Time: 9:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="CSS/chat.css">
    <title>Title</title>
</head>
<body>


<%--chat bot code--%>

<div class="chat-bar-collapsible">
    <button id="chat-button" type="button" class="collapsible">
        <i  style="color: #fff;" class="fa fa-fw fa-comments-o chat-icon"></i>
    </button>

    <div class="content">
        <div class="full-chat-block">
            <!-- Message Container -->
            <div class="outer-container">
                <div class="chat-container">
                    <!-- Messages -->
                    <div id="chatbox">
                        <h5 id="chat-timestamp"></h5>
                        <p id="botStarterMessage" class="botText"><span>Loading...</span></p>
                    </div>

                    <!-- User input box -->
                    <div class="chat-bar-input-block">
                        <div id="userInput">
                            <input id="textInput" class="input-box" type="text" name="msg"
                                   placeholder="Tap 'Enter' to send a message">
                            <p></p>
                        </div>

                        <div class="chat-bar-icons">
                            <i  style="color: orange;" class="fa fa-smile-o chat-icon"
                                onclick="heartButton()"></i>
                            <i  style="color: #fff;" class="fa fa-fw fa-send chat-icon"
                                onclick="sendButton()"></i>
                        </div>
                    </div>

                    <div id="chat-bar-bottom">
                        <p></p>
                    </div>

                </div>
            </div>

        </div>
    </div>

</div>







<script src="JS/chat.js"></script>
<script src="JS/responses.js"></script>
</body>
</html>
