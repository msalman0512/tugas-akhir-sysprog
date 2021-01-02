import cv2

classifier = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
camera = cv2.VideoCapture(0)

if(camera.isOpened()):
    success, frame = camera.read()
    bboxes = classifier.detectMultiScale(frame)

    for box in bboxes:
        x, y, width, height = box
        x2, y2 = x + width, y + height
        cv2.rectangle(frame, (x, y), (x2, y2), (0, 0, 255), 1)

    if success==True:
        cv2.imwrite("output.jpg", frame)
    else:
        print("Error when reading the frame")
else:
    print("Error when opening the webcam")

# Release everything if job is finished
camera.release()
cv2.destroyAllWindows()