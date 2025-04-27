function cal_Rect_Area() {
    const len = parseFloat(document.getElementById('Rect_L').value);
    const wid = parseFloat(document.getElementById('Rect_W').value);

    if (isNaN(len) || isNaN(wid) || len <= 0 || wid <= 0) {
        document.getElementById('Rect_A').innerText = "Please enter valid positive values.";
        return;
    }

    const area = len * wid;
    document.getElementById('Rect_A').innerText = `Area of the Rectangle: ${area}`;
}

function cal_Circ_Area() {
    const rad = parseFloat(document.getElementById('Circ_R').value);

    if (isNaN(rad) || rad <= 0) {
        document.getElementById('Circ_A').innerText = "Please enter a valid positive radius.";
        return;
    }

    const area = Math.PI * rad * rad;
    document.getElementById('Circ_A').innerText = `Area of the Circle: ${area.toFixed(2)}`;
}

function cal_Tria_Area() {
    const a = parseFloat(document.getElementById('Tria_X').value);
    const b = parseFloat(document.getElementById('Tria_Y').value);
    const c = parseFloat(document.getElementById('Tria_Z').value);

    if (isNaN(a) || isNaN(b) || isNaN(c) || a <= 0 || b <= 0 || c <= 0) {
        document.getElementById('Tria_A').innerText = "Please enter valid positive side lengths.";
        return;
    }

    if (a + b <= c || a + c <= b || b + c <= a) {
        document.getElementById('Tria_A').innerText = "The provided sides do not form a valid triangle.";
        return;
    }

    const s = (a + b + c) / 2;
    const area = Math.sqrt(s * (s - a) * (s - b) * (s - c));
    document.getElementById('Tria_A').innerText = `Area of the Triangle: ${area.toFixed(2)}`;
}
