import cv2

classifier = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
camera = cv2.VideoCapture(0)

fourcc = cv2.VideoWriter_fourcc(*'XVID')
out = cv2.VideoWriter('output.avi', fourcc, 20.0, (640, 480))

while(camera.isOpened()):
    success, frame = camera.read()
    bboxes = classifier.detectMultiScale(frame)

    for box in bboxes:
        x, y, width, height = box
        x2, y2 = x + width, y + height
        cv2.rectangle(frame, (x, y), (x2, y2), (0, 0, 255), 1)

    if success==True:
        out.write(frame)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release everything if job is finished
camera.release()
out.release()
cv2.destroyAllWindows()
