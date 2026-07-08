(ns cars-assemble)

(def cph 221)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (cond (= speed 0)   0
        (<= speed 4)  (* speed cph)
        (<= speed 8)  (* (* speed cph) 0.9)
        (<= speed 9)  (* (* speed cph) 0.8)
        (<= speed 10) (* (* speed cph) 0.77)
        :else "Error"
        )
  )

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (cond (= speed 0)   0
        (= speed 1)   (quot cph 60)
        (<= speed 4)  (* speed (/ cph 60))
        (<= speed 8)  (int (* 0.9   (* speed (/ cph 60))))
        (<= speed 9)  (int (* 0.8   (* speed (/ cph 60))))
        (<= speed 10) (int (* 0.77  (* speed (/ cph 60))))
        :else "Error"))

(working-items 1)
