#include <QQuickItem>
#include <QString>
#include <memory>
#include "document_item.hpp"
#include "page.hpp"

namespace cpp_elements
{

class PageItem : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(
        DocumentItem* document READ getDocument WRITE setDocument CONSTANT)
    Q_PROPERTY(
        int implicitWidth READ getImplicitWidth NOTIFY implicitWidthChanged)
    Q_PROPERTY(
        int implicitHeight READ getImplicitHeight NOTIFY implicitHeightChanged)
    Q_PROPERTY(int pageNumber READ getPageNumber WRITE setPageNumber CONSTANT)


public:
    PageItem();

    int getImplicitWidth() const;
    int getImplicitHeight() const;

    DocumentItem* getDocument() const;
    void setDocument(DocumentItem* newDocument);

    int getPageNumber() const;
    void setPageNumber(int newCurrentPage);

private slots:
    void updateZoom(float newZoom);

protected:
    void geometryChange(const QRectF& newGeometry,
                        const QRectF& oldGeometry) override;
    QSGNode* updatePaintNode(QSGNode* node, UpdatePaintNodeData* _) override;

private:
    DocumentItem* m_document = nullptr;
    std::unique_ptr<application::core::Page> m_page;
    int m_currentPage = 0;
};

}  // namespace cpp_elements