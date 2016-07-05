def calculate_z_serial_purepython(list q, unsigned int maxiter, list z):
    cdef unsigned int i
    cdef int iteration

    output = [0] * len(q)
    for i in range(len(q)):
        zi = z[i]
        qi = q[i]
        for iteration in range(maxiter):
            zi = zi**2 + qi
            if abs(zi) > 2.0:
                output[i] = iteration
                break
    return output