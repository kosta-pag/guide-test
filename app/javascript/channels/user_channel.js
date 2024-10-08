import consumer from "./consumer"

consumer.subscriptions.create({ channel: "UserChannel" }, {
  connected() {
    console.log("Connected to UserChannel");
  },

  disconnected() {
    console.log("Disconnected from UserChannel");
  },

  received(data) {
    console.log("Message received:", data);

    const notificationDiv = document.getElementById('csv-download-link');
    if (notificationDiv) {
      notificationDiv.innerHTML = `
        <div class="alert bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative">
          ${data.message} <a href="${data.download_link}" class="text-blue-500 underline">Download CSV</a>
        </div>
      `;
    }
  }
});
