def calculate_z_serial_purepython(list q, unsigned int maxiter, list z):
    cdef unsigned int i
    cdef int iteration
    cdef list output
    cdef double zr, zi, qr, qi, zr_new, zi_new

    output = [0] * len(q)
    for i in range(len(q)):
        zr = z[i].real
        zi = z[i].imag
        qr = q[i].real
        qi = q[i].imag
        for iteration in range(maxiter):
            zr_new = (zr * zr - zi * zi) + qr
            zi_new = (zr * zi + zi * zr) + qi
            zr = zr_new
            zi = zi_new

            if (zr*zr + zi*zi) > 4:
                output[i] = iteration
                break
    return output