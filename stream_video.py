import cv2

classifier = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
camera = cv2.VideoCapture(0)

while(camera.isOpened()):
    success, frame = camera.read()
    boxes = classifier.detectMultiScale(frame)

    for box in boxes:
        x, y, width, height = box
        x2, y2 = x + width, y + height
        cv2.rectangle(frame, (x, y), (x2, y2), (0, 0, 255), 1)

    cv2.imshow('frame', frame)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release everything if job is finished
camera.release()
cv2.destroyAllWindows()
