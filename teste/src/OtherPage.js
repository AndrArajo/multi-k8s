import React from "react"
import {Link} from "react-router-dom"

export default () => {
    return (
        <div>
            Estou em outra página
            <Link to="/">Voltar para a home</Link>
        </div>
    )
}