-- Ajustes para el EPUB:
-- 1. Quita los enlaces "anterior / siguiente" pensados para leer en GitHub.
-- 2. Convierte en texto los enlaces a otros archivos .md, que en el EPUB no existen.

function Div(el)
  if el.classes:includes("navegacion") then
    return {}
  end
end

function Link(el)
  if el.target:match("%.md$") or el.target:match("%.md#") then
    return el.content
  end
end

-- 3. En el EPUB, el diagrama va en PNG: varios lectores de libros
--    electrónicos muestran mal los SVG.
function Image(el)
  el.src = el.src:gsub("%.svg$", ".png")
  return el
end
